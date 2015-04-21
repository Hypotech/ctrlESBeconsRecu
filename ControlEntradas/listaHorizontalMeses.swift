//
//  listaHorizontalMeses.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 14/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

protocol listaHorizontalMesesDelegado{
    func llevarTareaDepuesDeMesSeleccionado(MES:mes, indice:Int)
}

class listaHorizontalMeses: NSObject {
    private var botonesMeses:[botonMes] = []
    var viewScroll:UIScrollView!
    var delegado:listaHorizontalMesesDelegado?
    
    
    init(superVDim:CGRect,botonesMes:botonMes...) {
        
        super.init()

        var ubicacionBoton = CGPoint(x: 0, y: 0)
        for i in botonesMes{
//            var tmp_btn = UIButton.buttonWithType(UIButtonType.System) as UIButton

            
            i.frame.origin = ubicacionBoton
            
            switch (i.Mes) {
            case .Enero:
                i.setTitle("Enero", forState: .Normal)
            case .Febrero:
                i.setTitle("Febrero", forState: .Normal)
            case .Marzo:
                i.setTitle("Marzo", forState: .Normal)
            case .Abril:
                i.setTitle("Abril", forState: .Normal)
            case .Mayo:
                i.setTitle("Mayo", forState: .Normal)
            case .Junio:
                i.setTitle("Junio", forState: .Normal)
            case .Julio:
                i.setTitle("Julio", forState: .Normal)
            case .Agosto:
                i.setTitle("Agosto", forState: .Normal)
            case .Septiembre:
                i.setTitle("Septiembre", forState: .Normal)
            case .Octubre:
                i.setTitle("Octubre", forState: .Normal)
            case .Noviembre:
                i.setTitle("Noviembre", forState: .Normal)
            case .Diciembre:
                i.setTitle("Diciembre", forState: .Normal)
            default:
                i.setTitle("", forState: .Normal)
            }
            
            i.titleLabel!.font = UIFont(name: "Nexa-Light-Italic", size: 17.0)
            i.addTarget(self, action: "mesPresionado:", forControlEvents: .TouchUpInside)
            var sizeExperado:CGSize = i.titleLabel!.sizeThatFits(CGSize(width: 0,height: 40))
            i.frame.size.width = sizeExperado.width
            i.frame.size.height = 40
            ubicacionBoton.x = i.frame.maxX + 12
            
            botonesMeses.append(i)
        }
        
        //*************************** Posicion de los wigets ************************** //
        viewScroll = UIScrollView(frame: CGRect(x: 0,
                                            y: 0,
                                            width: superVDim.width,
                                            height: 40))
        
        //****************************************************************************//
        
        //####################### Personalizando los widgets ########################//
        viewScroll.contentSize = CGSize(width:  botonesMeses.last!.frame.maxX + 10, height: 40)
        viewScroll.showsVerticalScrollIndicator = false
        viewScroll.showsHorizontalScrollIndicator = false
//        scroll.backgroundColor = UIColor.greenColor()
        
        var indice = 0
        for i in botonesMeses{
            i.setTitleColor(UIColor(red: 15/255, green: 133/255, blue: 134/255, alpha: 1.0), forState: .Disabled)
            i.setTitleColor(UIColor(red: 213/255, green: 232/255, blue: 232/255, alpha: 1.0), forState: .Normal)
            
            i.tag = indice
            indice++
            viewScroll.addSubview(i)
        }
        botonesMeses[0].enabled = false
        //##########################################################################//
        
//        for family in UIFont.familyNames(){
//            println(family)
//            
//            for name in UIFont.fontNamesForFamilyName(family as String){
//                var tmp = name as String
//                println("-" + tmp)
//            }
//        }
    }
    
    func mesPresionado(sender:botonMes!) {
        
        actualizarSeleccion(sender.tag)
        self.delegado?.llevarTareaDepuesDeMesSeleccionado(sender.Mes, indice:sender.tag)
    }
    
    func actualizarSeleccion(indice:Int){
        
        for i in botonesMeses{ //todos de color gris menos el presionado
            i.enabled =  true
        }
        
        botonesMeses[indice].enabled = false //boton presionado de color azul
    }
}