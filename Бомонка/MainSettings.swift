//
//  MainSettings.swift
//  Бомонка
//
//  Created by Ацамаз on 14/11/2018.
//  Copyright © 2018 a.s.bitsoev. All rights reserved.
//

import UIKit

class MainSettings: UIViewController {

    
    
   
    
    
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var labCurrentWeek: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view1.layer.cornerRadius = 16
        view2.layer.cornerRadius = 16
        view3.layer.cornerRadius = 16
        view4.layer.cornerRadius = 16
        labCurrentWeek.text = "Сейчас \(currentWeek) неделя"

    }
    
    @IBAction func butFeedback(_ sender: UIButton) {
        
        guard let url = URL(string: "https://www.instagram.com/a.s.bitsoev/") else {return}
        UIApplication.shared.open(url)
        
    }
    
    
    

}
