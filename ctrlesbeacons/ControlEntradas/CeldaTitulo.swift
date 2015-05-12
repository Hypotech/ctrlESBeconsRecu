//
//  CeldaTitulo.swift
//  HorarioControl
//
//  Created by desarm on 24/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class CeldaTitulo: CeldaBase {
    var lbl_Entrada = UILabel()
    var lbl_Salida = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        println("Aqui entro")
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        lbl_Entrada.frame = CGRect(x: 120, y: 0, width: 90, height: 20)
        lbl_Salida.frame = CGRect(x: lbl_Entrada.frame.maxX + 30, y: 0, width: 90, height: 20)
        
        lbl_Entrada.text = "Entradas"
        lbl_Salida.text = "Salidas"
        
        lbl_Entrada.textColor = UIColor.blackColor()
        
        contentView.addSubview(lbl_Entrada)
        contentView.addSubview(lbl_Salida)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}