//
//  CeldaBase.swift
//  HorarioControl
//
//  Created by desarm on 24/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import Uikit

class CeldaBase: UITableViewCell {
    
    var alto:CGFloat

     init(tamañoAlto:CGFloat) {
        alto = tamañoAlto
        
        super.init(style: .Default, reuseIdentifier: "fecha")
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        alto = 44.0
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        alto = 0
        super.init(coder: aDecoder)
    }
}