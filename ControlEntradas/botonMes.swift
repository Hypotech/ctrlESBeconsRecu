//
//  botonMes.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 16/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class botonMes: UIButton {
//    private var boton = UIButton.buttonWithType(UIButtonType.System) as UIButton
    var Mes:mes = .Ninguno
    
    init( nombre:mes,frame:CGRect = CGRect.zeroRect) {
        Mes = nombre
        super.init(frame:frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
