//
//  File.swift
//  Celda_Usuario
//
//  Created by desarrolloRM on 31/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//


import UIKit

class Celda_Usuario:CeldaBase{
    var fotoUsario:UIImageView!
    var lbl_nombreUsrio:UILabel!
    var accessoryImagen:UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        fotoUsario = UIImageView(frame: CGRect( x: R_CLDA_FOTO_USRIO.minX,
                                                y: R_CLDA_FOTO_USRIO.minY,
                                            width: R_CLDA_FOTO_USRIO.width,
                                           height: R_CLDA_FOTO_USRIO.height))

        lbl_nombreUsrio = UILabel(frame: CGRect(x: R_CLDA_NOM_USRIO.minX, y: R_CLDA_NOM_USRIO.minY,
            width: R_CLDA_NOM_USRIO.width,
            height: R_CLDA_NOM_USRIO.height))
        
        accessoryImagen = UIImageView(frame: CGRect(x: R_CLDA_IMG_ACCESORY.minX, y: R_CLDA_IMG_ACCESORY.minY,
            width: R_CLDA_IMG_ACCESORY.width,
            height: R_CLDA_IMG_ACCESORY.height))
        
        //######################### Personalizando los widgets #######################//
        lbl_nombreUsrio.text = "Christian Hipolito Morales"
        fotoUsario.image = UIImage(named: "smile-icon.png")
        accessoryImagen.image = UIImage(named: "checkMark.jpg")
        
        super.alto = fotoUsario.frame.height
        //###########################################################################//
        
        contentView.addSubview(fotoUsario)
        contentView.addSubview(lbl_nombreUsrio)
        contentView.addSubview(accessoryImagen)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}