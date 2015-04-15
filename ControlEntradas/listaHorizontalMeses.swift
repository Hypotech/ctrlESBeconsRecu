//
//  listaHorizontalMeses.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 14/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

protocol listaHorizontalMesesDelegado{
    func llevarTareaBotonPresionado(MES:mes)
}

class listaHorizontalMeses: NSObject {
    private var botonesMeses:[UIButton] = []
    var Seleccionado:mes
    var viewContent:UIScrollView!
    var delegado:listaHorizontalMesesDelegado?
    
    
    init(superVDim:CGRect) {
        
        Seleccionado = .Ninguno
        super.init()
        
        var listaMeses = [  "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
            "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]

        var rect_ubiBoton = CGRect (x: 0, y: 0, width: 68, height: 40)
        
        for i in listaMeses{
            
            var tmp_btn = UIButton.buttonWithType(UIButtonType.System) as UIButton

            if (i != "Enero"){
                tmp_btn.enabled = false
            }
            
            tmp_btn.frame = rect_ubiBoton
            tmp_btn.setTitle(i, forState: .Normal)
            
            tmp_btn.addTarget(self, action: "mesPresionado:", forControlEvents: .TouchUpInside)
            
            var sizeExperado:CGSize = tmp_btn.titleLabel!.sizeThatFits(CGSize(width: 0,height: 40))
            tmp_btn.frame.size = sizeExperado
            tmp_btn.frame.size.height = 40
            rect_ubiBoton.origin.x = tmp_btn.frame.maxX + 12
            
//            tmp_btn.backgroundColor = UIColor.redColor()
            botonesMeses.append(tmp_btn)
        }
        
        //*************************** Posicion de los wigets ************************** //
        viewContent = UIScrollView(frame: CGRect(x: 0,
                                            y: 0,
                                            width: superVDim.width,
                                            height: 40))
        
        //****************************************************************************//
        
        //####################### Personalizando los widgets ########################//
        viewContent.contentSize = CGSize(width:  botonesMeses.last!.frame.maxX + 10, height: 40)
        viewContent.showsVerticalScrollIndicator = false
        viewContent.showsHorizontalScrollIndicator = false
//        scroll.backgroundColor = UIColor.greenColor()
        
        for i in botonesMeses{
            viewContent.addSubview(i)
        }
        
        //##########################################################################//
    }
    
    func mesPresionado(sender:UIButton!) {
        var Seleccionado:mes
        
        switch (sender.titleLabel!.text!) {
        case "Enero":
            Seleccionado = .Enero
        case "Febrero":
            Seleccionado = .Febrero
        case "Marzo":
            Seleccionado = .Marzo
        case "Abril":
            Seleccionado = .Abril
        case "Mayo":
            Seleccionado = .Mayo
        case "Junio":
            Seleccionado = .Junio
        case "Julio":
            Seleccionado = .Julio
        case "Agosto":
            Seleccionado = .Agosto
        case "Septiembre":
            Seleccionado = .Septiembre
        case "Octubre":
            Seleccionado = .Octubre
        case "Noviembre":
            Seleccionado = .Noviembre
        case "Diciembre":
            Seleccionado = .Diciembre
        default:
            Seleccionado = .Ninguno
        }
        
        self.delegado?.llevarTareaBotonPresionado(Seleccionado)
    }
}