/*  Una View personalizada para el TextField utilizado en los formularios de las escenas
*   editarPerfil y registroXEmail. Para modificar el TextField se debe realizar a través
*   de la variable  publica "textField" de esta clase
*
*  tFiPersonalizado.swift
*  ControlEntradas
*
*  Created by desarrolloRM on 28/04/15.
*  Copyright (c) 2015 Desarrollo RM. All rights reserved.
*/

import UIKit

class tFiPersonalizado:UIView{
    
    var textField:UITextField
    
    override init(let frame: CGRect) {
        
        var frameTexField =  CGRect(x: frame.minX + 10,
                                    y: frame.minY + 14,
                                    width: frame.width - 20,
                                    height: frame.height - 14)
        
        textField = UITextField(frame: frameTexField) //inicializa el textField

        //****************************** Posicion de los wigets ******************************//
        let grosorLinea:CGFloat = 0.5
        let alturaEsquinas = frame.height * 0.2
        
        var linea_izq = UIView(frame: CGRect(x: grosorLinea,
                                             y: frame.maxY - alturaEsquinas,
                                             width: grosorLinea,
                                             height: alturaEsquinas) )
        
        var linea_der = UIView(frame: CGRect(x: frame.maxX - grosorLinea,
                                             y: linea_izq.frame.minY,
                                             width: grosorLinea,
                                             height: alturaEsquinas) )
        
        var linea_baja = UIView(frame:CGRect(x: linea_izq.frame.maxX,
                                            y: linea_izq.frame.maxY - grosorLinea,
                                            width: linea_der.frame.minX - linea_izq.frame.maxX,
                                            height: grosorLinea))
        
        //***********************************************************************************//
        
        //######################### Personalización de los widgets #########################//
        
        linea_baja.backgroundColor = UIColor.lightGrayColor()
        linea_izq.backgroundColor = linea_baja.backgroundColor
        linea_der.backgroundColor = linea_baja.backgroundColor
        
        //##################################################################################//
        
        super.init(frame: frame)
        
        self.addSubview(linea_baja)
        self.addSubview(linea_izq)
        self.addSubview(linea_der)
        self.addSubview(textField)
    }

    required init(coder aDecoder: NSCoder) {
        textField = UITextField()
        super.init(coder: aDecoder)
    }
    

}