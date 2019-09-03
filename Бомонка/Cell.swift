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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
