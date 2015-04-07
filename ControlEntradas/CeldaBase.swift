//
//  CeldaBase.swift
//  HorarioControl
//
//  Created by desarm on 24/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import Uikit

class CeldaBase: UITableViewCell {
    var alto:CGFloat  = 30.0

     init(tamañoAlto:CGFloat) {
        alto = tamañoAlto
        super.init()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}