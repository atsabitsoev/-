//
//  Model.swift
//  Бомонка
//
//  Created by Ацамаз on 06/11/2018.
//  Copyright © 2018 a.s.bitsoev. All rights reserved.
//

import Foundation


class Subject : NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: "name")
        aCoder.encode(teacher, forKey: "teacher")
        aCoder.encode(time, forKey: "time")
        aCoder.encode(place, forKey: "place")
        aCoder.encode(type, forKey: "type")
        aCoder.encode(week1, forKey: "week1")
        aCoder.encode(week2, forKey: "week2")
        aCoder.encode(weekDay, forKey: "weekDay")
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        name = aDecoder.decodeObject(forKey: "name") as! String
        teacher = aDecoder.decodeObject(forKey: "teacher") as! String
        
        place = aDecoder.decodeObject(forKey: "place") as! String
        type = aDecoder.decodeObject(forKey: "type") as! String

        weekDay = aDecoder.decodeInteger(forKey: "weekDay")
        time = aDecoder.decodeInteger(forKey: "time")
        week1 = aDecoder.decodeBool(forKey: "week1")
        week2 = aDecoder.decodeBool(forKey: "week2") 
        
    }
    
    
    
    init (name : String,
          teacher : String,
          time : Int,
          place : String,
          type : String,
          week1 : Bool,
          week2 : Bool,
          weekDay : Int) {
        
        self.name = name
        self.teacher = teacher
        self.time = time
        self.place = place
        self.type = type
        self.week1 = week1
        self.week2 = week2
        self.weekDay = weekDay
    }
    
    var name : String
    var teacher : String
    var time : Int
    var place : String
    var type : String
    var week1 : Bool
    var week2 : Bool
    var weekDay : Int
}
