//
//  SettingsViewController.swift
//  Бомонка
//
//  Created by Ацамаз on 10/11/2018.
//  Copyright © 2018 a.s.bitsoev. All rights reserved.
//

import UIKit
import SwiftSoup

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    var searchingNow = false
    
    var arrayAfterSarching : [String] = []
    var arrayOfLinks :[String] = []
    
    @IBOutlet weak var viewFeedBack: UIView!
    
    
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    
    @IBOutlet weak var butChooseOut: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if searchingNow {
            return arrayAfterSarching.count
        } else {
        return arrayOfGroupNames.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        if !searchingNow {
        let s = NSAttributedString(string: arrayOfGroupNames[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return s
        } else {
            
            
            
            
            let s = NSAttributedString(string: arrayAfterSarching[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
            
            return s
            
            
        }
        
    }
        
    
    
    
    
    
    
    
    
    var arrayOfGroupNames: [String] = []
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        butChooseOut.isUserInteractionEnabled = false
       
        
        
        loading.startAnimating()
        
        butChooseOut.layer.cornerRadius = 22
        self.textField.delegate = self
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        
        getArraysOfGroupsAndLinks(url: "https://students.bmstu.ru/schedule/list")
        
        
        
        
        
        
        
        
        

    }
    

    
    
    func getArraysOfGroupsAndLinks (url : String) {
        
        
        let myUrl = URL(string: url)
        
        let URLTask = URLSession.shared.dataTask(with: myUrl!){
            myData, response, error in
            
            guard error == nil else { return }
            
            let myHTMLString = String(data: myData!, encoding: String.Encoding.utf8)
            
            
            
            
            
            
            
            
            
            do {
                
                let doc = try SwiftSoup.parse(myHTMLString!)
                
                do {
                    
                    let element = try doc.select("a").array()
                    
                    
                    do{
                    
                        var arr1 : [String] = []
                        for i in element {
                            if try i.select("h4").text() == "" {
                                print(try i.text())
                                arr1.append(try i.text())
                                
                            }
                            
                        }
                        self.arrayOfGroupNames = arr1
                        self.arrayOfGroupNames.removeFirst(2)
                        self.arrayOfGroupNames.removeLast()
                        print(self.arrayOfGroupNames.first!)
                        print(self.arrayOfGroupNames.last!)
                        
                        DispatchQueue.main.async {
                            
                            self.pickerView.reloadAllComponents()
                            self.loading.stopAnimating()
                            self.loading.isHidden = true
                            self.pickerView.isHidden = false
                            
                        }
                        var arr2 : [String] = []
                        for i in element {
                            if try i.select("h4").text() == "" {
                                
                                print(try i.attr("href"))
                                arr2.append(try i.attr("href"))
                                
                            }
                            
                        }
                        self.arrayOfLinks = arr2
                        self.arrayOfLinks.removeFirst(2)
                        self.arrayOfLinks.removeLast()
                        print(self.arrayOfLinks.first!)
                        print(self.arrayOfLinks.last!)
                        
                         DispatchQueue.main.async {
                            self.butChooseOut.isUserInteractionEnabled = true
                        }
                    
                    }catch {
                        
                    }
                    
                } catch {
                    
                }
                
            } catch {
                
            }
            
            
            
            
        }
        URLTask.resume()
        
    }
    
    
    @IBAction func textChanged(_ sender: UITextField) {
        
        arrayAfterSarching = []
        for i in arrayOfGroupNames {
            
            if i.hasPrefix(textField.text!) {
                arrayAfterSarching.append(i)
            }
            
        }
        searchingNow = true
        print("eool")
        DispatchQueue.main.async {
            self.pickerView.reloadAllComponents()
        }
        
        
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
        
    
    
        
    
    @IBAction func buttonChooseAction(_ sender: UIButton) {
        var selectedValue = ""
        if searchingNow {
            
            selectedValue = arrayAfterSarching[pickerView.selectedRow(inComponent: 0)]
            
            
        } else {
            selectedValue = arrayOfGroupNames[pickerView.selectedRow(inComponent: 0)]
            
        }
        
        print(selectedValue)
        myURLString = "https://students.bmstu.ru" + arrayOfLinks[arrayOfGroupNames.firstIndex(of: selectedValue)!]
        print(myURLString)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Загрузить расписание"), object: nil)
        
        
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
        
        
    }
    
    
    
    
    
    
    
    
        
   
    
    
    
    
    
    
   
}
