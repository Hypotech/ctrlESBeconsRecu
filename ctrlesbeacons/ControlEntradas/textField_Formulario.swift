/*  Una View personalizada para el TextField utilizado en los formularios de las escenas
*   editarPerfil y registroXEmail. Para modificar el TextField se debe realizar a través
*   de la variable  publica "textField" de esta clase
*
*  textField_Formulario.swift
*  ControlEntradas
*
*  Created by desarrolloRM on 28/04/15.
*  Copyright (c) 2015 Desarrollo RM. All rights reserved.
*/

import UIKit

protocol textField_FormularioDelegate{
    func textFieldSeleccionado(campo:String)
}

class textField_Formulario:UIView{
    
    var textField:UITextField
    var delegado:textField_FormularioDelegate?
    
    override init(frame: CGRect) {

        var frameTexField =  CGRect(x: frame.minX + 10,
                                    y: frame.minY + 14,
                                    width: frame.width - 20,
                                    height: frame.height - 14)
        
        textField = UITextField(frame: frameTexField) //textField un poco más chico que el view contenedor
        super.init(frame: frame)
        //****************************** Posicion de los wigets ******************************//
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
        
        var gestoTap = UITapGestureRecognizer(target: self, action: "comenzoEdicionTField")
        
//        textField.addTarget(self, action: "comenzoEdicionTField", forControlEvents: .TouchCancel)
//        textField.addTarget(self, action: "comenzoEdicionTField", forControlEvents: .AllTouchEvents)
        textField.addGestureRecognizer(gestoTap)
        
//        textField.addTarget(self, action: "finalizoEdicionTField", forControlEvents: .EditingDidEnd)
        
        linea_baja.backgroundColor = UIColor.lightGrayColor()
        linea_izq.backgroundColor = linea_baja.backgroundColor
        linea_der.backgroundColor = linea_baja.backgroundColor
        
        //##################################################################################//

        
        self.addSubview(linea_baja)
        self.addSubview(linea_izq)
        self.addSubview(linea_der)
        self.addSubview(textField)
    }

    required init(coder aDecoder: NSCoder) {
        textField = UITextField()
        super.init(coder: aDecoder)
    }
    
    func comenzoEdicionTField(){
        
//        textField.text = ""
        delegado?.textFieldSeleccionado(textField.placeholder!)
    }
    
    func finalizoEdicionTField(){
        delegado?.textFieldSeleccionado(textField.placeholder!)
    }
}