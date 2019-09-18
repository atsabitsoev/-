//
//  Cell.swift
//  Бомонка
//
//  Created by Ацамаз on 06/11/2018.
//  Copyright © 2018 a.s.bitsoev. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    @IBOutlet weak var labPara: UILabel!
    @IBOutlet weak var labTime: UILabel!
    @IBOutlet weak var labSubjectName: UILabel!
    @IBOutlet weak var labTeacher: UILabel!
    @IBOutlet weak var labPlace: UILabel!
    @IBOutlet weak var labType: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if labPlace.text == "" ||
            labPlace.text == nil {
            
            labPlace.isHidden = true
        } else {
            labPlace.isHidden = false
        }
    }

}
