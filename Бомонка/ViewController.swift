//
//  ViewController.swift
//  Бомонка
//
//  Created by Ацамаз on 06/11/2018.
//  Copyright © 2018 a.s.bitsoev. All rights reserved.
//

import UIKit
import SwiftSoup
import Timepiece

var currentWeek = 0

var weekNum = true
var myURLString = "https://students.bmstu.ru/schedule/40506066-c780-11e6-9e01-005056960017"
var finalArray: [[[Subject]]] = []

let dateOfFirstDayOfSemestr = Date(era: 1, year: 2019, month: 2, day: 4, hour: 0, minute: 0, second: 0, nanosecond: 0, on: Calendar(identifier: Calendar.Identifier.gregorian))


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   var arrayOfSubjects: [Subject] = []
    
    var weekChanged = false
    
    var currentIndex = 0
    
    @IBOutlet weak var butWeek: UIButton!
    
    
    
    
     @IBOutlet weak var scrollView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if finalArray.count != 0 {
            
            if weekNum {
               return finalArray[0][section].count
            }
            else {
                return finalArray[1][section].count
            }
            
            
            
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Cell
        
        if finalArray.count != 0 {
            if weekNum {
                if finalArray[0][indexPath.section][indexPath.row].week1 {
                
                cell.labSubjectName.text = finalArray[0][indexPath.section][indexPath.row].name
                cell.labPara.text = "\(finalArray[0][indexPath.section][indexPath.row].time) пара"
                cell.labPlace.text = finalArray[0][indexPath.section][indexPath.row].place
                cell.labTeacher.text = finalArray[0][indexPath.section][indexPath.row].teacher
                cell.labType.text = finalArray[0][indexPath.section][indexPath.row].type
                
                switch finalArray[0][indexPath.section][indexPath.row].time {
                case 1:
                    cell.labTime.text = "08:30 10:05"
                case 2:
                    cell.labTime.text = "10:15 11:50"
                case 3:
                    cell.labTime.text = "12:00 13:35"
                case 4:
                    cell.labTime.text = "13:50 15:25"
                case 5:
                    cell.labTime.text = "15:40 17:15"
                case 6:
                    cell.labTime.text = "17:25 19:00"
                case 7:
                    cell.labTime.text = "19:10 20:45"
                default:
                    break
                    
                }
            
                if (cell.labPlace.text?.contains(","))! || (cell.labPlace.text?.contains(" "))! {
                    cell.labPlace.numberOfLines = 2
                } else {
                    cell.labPlace.numberOfLines = 1
                }
                }
            } else {
                if finalArray[1][indexPath.section][indexPath.row].week2 {
                
                    cell.labSubjectName.text = finalArray[1][indexPath.section][indexPath.row].name
                    cell.labPara.text = "\(finalArray[1][indexPath.section][indexPath.row].time) пара"
                    cell.labPlace.text = finalArray[1][indexPath.section][indexPath.row].place
                    cell.labTeacher.text = finalArray[1][indexPath.section][indexPath.row].teacher
                    cell.labType.text = finalArray[1][indexPath.section][indexPath.row].type
                    
                    switch finalArray[1][indexPath.section][indexPath.row].time {
                    case 1:
                        cell.labTime.text = "08:30 10:05"
                    case 2:
                        cell.labTime.text = "10:15 11:50"
                    case 3:
                        cell.labTime.text = "12:00 13:35"
                    case 4:
                        cell.labTime.text = "13:50 15:25"
                    case 5:
                        cell.labTime.text = "15:40 17:15"
                    case 6:
                        cell.labTime.text = "17:25 19:00"
                    case 7:
                        cell.labTime.text = "19:10 20:45"
                    default:
                        break
                        
                    }
                    
                    if (cell.labPlace.text?.contains(","))! || (cell.labPlace.text?.contains(" "))! {
                        cell.labPlace.numberOfLines = 2
                    } else {
                        cell.labPlace.numberOfLines = 1
                    }
                
                
                }
                
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 6
    }
    
  //  func sectionIndexTitles(for tableView: UITableView) -> [String]? {
  //      return ["ПН","•", "ВТ","•", "СР","•", "ЧТ","•", "ПТ","•", "СБ"]
  //  }
  //  func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at //index: Int) -> Int {
  //      switch title {
  //
  //      case "ПН":
  //          currentIndex = 0
  //          return 0
  //      case "ВТ":
  //          currentIndex = 1
  //          return 1
  //      case "СР":
  //          currentIndex = 2
  //          return 2
  //      case "ЧТ":
  //          currentIndex = 3
  //          return 3
  //      case "ПТ":
  //          currentIndex = 4
  //          return 4
  //      case "СБ":
  //          currentIndex = 5
  //          return 5
  //      default:
  //          return currentIndex
  //      }
  //  }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "header") as! HeaderCell
        headerCell.backgroundColor = UIColor(white: 0.3, alpha: 0.3)
        
        switch section {
        case 0:
           headerCell.labWeekDay.text = "Понедельник"
        case 1:
            headerCell.labWeekDay.text = "Вторник"
        case 2:
            headerCell.labWeekDay.text = "Среда"
        case 3:
            headerCell.labWeekDay.text = "Четверг"
        case 4:
            headerCell.labWeekDay.text = "Пятница"
        case 5:
            headerCell.labWeekDay.text = "Суббота"
        default:
            break
        }
        return headerCell
    }
   
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentWeek = Calendar(identifier: .gregorian).component(.weekOfYear, from: (Date()-1.day)!) - Calendar(identifier: .gregorian).component(.weekOfYear, from: dateOfFirstDayOfSemestr) + 1
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(setSchedule), name: NSNotification.Name(rawValue: "Выставить расписание"), object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(getArrayOfSubjects), name: NSNotification.Name(rawValue: "Загрузить расписание"), object: nil)
        
        
        whatWeek()
        
        if weekNum {
            self.navigationItem.leftBarButtonItem?.title = "Числитель"
        } else {
            self.navigationItem.leftBarButtonItem?.title = "Знаменатель"
        }
        
        
        print(weekNum)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            ])
        
        extendedLayoutIncludesOpaqueBars = true
        
        // Do any additional setup after loading the view.
        
        if self.view.frame.width > 375 {
            print("оово")
            self.view.backgroundColor = UIColor(patternImage:UIImage(named: "Фон-2")!)
        } else {
            self.view.backgroundColor = UIColor(patternImage:UIImage(named: "Фон-1")!)
        }
        
        
        let defaults = UserDefaults.standard
        
        if let savedPeople = defaults.object(forKey: "Расписание") as? Data {
            if let decodedPeople = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedPeople) as? [[[Subject]]] {
                finalArray = decodedPeople ?? [[[Subject]]]()
            }
        }
        
        
        
        
        print(finalArray)
        
        
    }
    
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
       
        setSchedule()
        
        let a = UserDefaults.standard.bool(forKey: "fr")
        if !a {
            
            UserDefaults.standard.set(true, forKey: "fr")
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let settings = storyboard.instantiateViewController(withIdentifier: "Настройки") as! SettingsViewController
            self.navigationController?.show(settings, sender: self)
            
        }
        
        if !UserDefaults.standard.bool(forKey: "alertGot") {
            
            chooseYourGroupAlert()
            
            UserDefaults.standard.set(true, forKey: "alertGot")
            
        }
        
    }
    
    
    
    

    
    
    @objc func getArrayOfSubjects () {
        
        let url = myURLString
        
        
        let myUrl = URL(string: url)
        
        let URLTask = URLSession.shared.dataTask(with: myUrl!){
            myData, response, error in
            
            guard error == nil else {
                print(error!)
                return  }
            
            let myHTMLString = String(data: myData!, encoding: String.Encoding.utf8)
            
            
            
            
            
            
            
            
            
            do {
                
                let doc = try SwiftSoup.parse(myHTMLString!)
                
                do {
                    
                    let element = try doc.select("td")
                    
                    
                    do{
                        
                        self.arrayOfSubjects = []
                        
                        var datchikWeekDay = 0
                        var datchikTime : Int = 0
                        
                        for i in element.array() {
                            
                            let text = try i.text()
                            let currentSubject = Subject(name: "", teacher: "", time: 0, place: "", type: "", week1: false, week2: false, weekDay: 0)
                            
                            
                            switch text {
                            case "08:30 - 10:05":
                                datchikTime = 1
                            case "10:15 - 11:50":
                                datchikTime = 2
                            case "12:00 - 13:35":
                                datchikTime = 3
                            case "13:50 - 15:25":
                                datchikTime = 4
                            case "15:40 - 17:15":
                                datchikTime = 5
                            case "17:25 - 19:00":
                                datchikTime = 6
                            case "19:10 - 20:45":
                                datchikTime = 7
                            case "ПН":
                                datchikWeekDay = 1
                            case "ВТ":
                                datchikWeekDay = 2
                            case "СР":
                                datchikWeekDay = 3
                            case "ЧТ":
                                datchikWeekDay = 4
                            case "ПТ":
                                datchikWeekDay = 5
                            case "СБ":
                                datchikWeekDay = 6
                            case "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота":
                                datchikTime = 0
                                datchikWeekDay = 0
                            case "Время", "ЧС", "ЗН":
                                datchikTime = 0
                            case "", " ":
                                break
                            default:
                                if datchikTime != 0  && datchikWeekDay != 0{
                                    
                                    
                                    currentSubject.name = try i.select("span").text()
                                    currentSubject.type = try i.select("i").array()[0].text()
                                    currentSubject.place = try i.select("i").array()[1].text()
                                    currentSubject.teacher = try i.select("i").array()[2].text()
                                    currentSubject.time = datchikTime
                                    currentSubject.weekDay = datchikWeekDay
                                    
                                    if try i.attr("class") == "text-success" {
                                        currentSubject.week1 = true
                                        currentSubject.week2 = false
                                    } else if try i.attr("class") == "text-info" {
                                        currentSubject.week1 = false
                                        currentSubject.week2 = true
                                    } else {
                                        currentSubject.week1 = true
                                        currentSubject.week2 = true
                                    }
                                    self.arrayOfSubjects.append(currentSubject)
                                }
                            }
                            
                            
                            
                            
                        }
                        
                        self.filterArray(self.arrayOfSubjects)
                        print(finalArray[0].count)
                        
                       
                        
                        
                        DispatchQueue.main.async {
                            
                            
                            self.scrollView.reloadData()
                            
                            print(self.whatWeekDay())
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                    } catch {
                        
                    }
                    
                } catch {
                    
                }
                
            } catch {
                
            }
            
            
            
            
        }
        URLTask.resume()
        
    }
    
    
    
    func filterArray (_ array:[Subject]) {
        var filteredArr : [[[Subject]]] = [[[], [], [], [], [], []], [[], [], [], [], [], []]]
        for subject in array {
            
            
            switch subject.weekDay {
            case 1:
                if subject.week1 {
                    filteredArr[0][0].append(subject)
                }
                if subject.week2 {
                    filteredArr[1][0].append(subject)
                }
            case 2:
                if subject.week1 {
                    filteredArr[0][1].append(subject)
                }
                if subject.week2 {
                    filteredArr[1][1].append(subject)
                }
            case 3:
                if subject.week1 {
                    filteredArr[0][2].append(subject)
                }
                if subject.week2 {
                    filteredArr[1][2].append(subject)
                }
            case 4:
                if subject.week1 {
                    filteredArr[0][3].append(subject)
                }
                if subject.week2 {
                    filteredArr[1][3].append(subject)
                }
            case 5:
                if subject.week1 {
                    filteredArr[0][4].append(subject)
                }
                if subject.week2 {
                    filteredArr[1][4].append(subject)
                }
            case 6:
                if subject.week1 {
                    filteredArr[0][5].append(subject)
                }
                if subject.week2 {
                    filteredArr[1][5].append(subject)
                }
            default:
                break
            }
            
            if subject.place.contains(",") {
                let ind = subject.place.firstIndex(of: ",")!
                subject.place.remove(at: ind)
                subject.place.insert(" ", at: ind)
            }
            
        }
        
         finalArray = filteredArr
        
        
    }
    
    
   
    @IBAction func butChangeWeek(_ sender: UIBarButtonItem) {
        whatWeek()
        weekChanged = !weekChanged
        
        if weekChanged {
            
            if weekNum {
            
            
            self.navigationItem.leftBarButtonItem?.title = "Знаменатель"
            
            } else {
                
                self.navigationItem.leftBarButtonItem?.title = "Числитель"
                
            }
            weekNum = !weekNum
        } else {
            if weekNum {
                
                self.navigationItem.leftBarButtonItem?.title = "Числитель \u{2022}"
                print("ggg")
                
            } else {
                
                self.navigationItem.leftBarButtonItem?.title = "Знаменатель \u{2022}"
                
            }
            
            
        }
        
        
        scrollView.reloadData()
        
        
    }
    
    
    func whatWeek() {
        let date = NSDate()
        let calendar = NSCalendar.current
        let components = calendar.component(.weekOfYear, from: date as Date)
        if components % 2 == 0 {
            weekNum = true
            
        }
        else {
            weekNum = false
            
        }
        print (weekNum)
        
    }
    
    
    func whatWeekDay() -> Int {
        let date = NSDate()
        let calendar = NSCalendar.current
        let weekday = calendar.component(.weekday, from: date as Date)
        return weekday
    }
    
    
    
    
    
    @objc func setSchedule () {
        
        whatWeek()
        if weekNum {
            self.navigationItem.leftBarButtonItem?.title = "Числитель \u{2022}"
        } else {
            self.navigationItem.leftBarButtonItem?.title = "Знаменатель \u{2022}"
        }
        scrollView.reloadData()
        
        
        if finalArray.count != 0{
            
            
            var section = whatWeekDay() - 2
            if section == -1 {
                section = 5
            }
            
            
            let week = weekNum ? 0 : 1
            if finalArray[week][section].count != 0 {
                scrollView.scrollToRow(at: NSIndexPath(row: 0, section: section) as IndexPath, at: UITableView.ScrollPosition.top, animated: true)
            }
            
            
        }
        
        
        weekChanged = false
        
        
    }
    
    
    // Начался новый семестр, измените группу
    func chooseYourGroupAlert () {
        let alert = UIAlertController(title: "Начался новый семестр!",
                                      message: "Так, как название вашей группы изменилось, зайдите в \"настройки\" и выберите свою группу",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
    
    

}
