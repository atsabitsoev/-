//
//  LabelWithInsets.swift
//  Бомонка
//
//  Created by Ацамаз Бицоев on 18/09/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//

import UIKit

class LabelWithInsets: UILabel {

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0,
                                  left: 6,
                                  bottom: 2,
                                  right: 6)
        super.drawText(in: rect.inset(by: insets))
    }

}
