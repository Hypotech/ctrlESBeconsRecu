//
//  listaHorizontalMeses.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 14/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class listaHorizontalMeses: NSObject {
    private var botonesMeses:[UIButton] = []
    var Selecionado:mes
    var scroll:UIScrollView!
    
    
    init(superVDim:CGRect) {
        
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
            
            var sizeExperado:CGSize = tmp_btn.titleLabel!.sizeThatFits(CGSize(width: 0,height: 40))
            tmp_btn.frame.size = sizeExperado
            tmp_btn.frame.size.height = 40
            rect_ubiBoton.origin.x = tmp_btn.frame.maxX + 12
            
//            tmp_btn.backgroundColor = UIColor.redColor()
            botonesMeses.append(tmp_btn)
        }
        
        //*************************** Posicion de los wigets ************************** //
        scroll = UIScrollView(frame: CGRect(x: 0,
                                            y: 0,
                                            width: superVDim.width,
                                            height: 40))
        
        //****************************************************************************//
        
        //####################### Personalizando los widgets ########################//
        Selecionado = .Ninguno
        scroll.contentSize = CGSize(width:  botonesMeses.last!.frame.maxX + 10, height: 40)
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
//        scroll.backgroundColor = UIColor.greenColor()
        
        for i in botonesMeses{
            scroll.addSubview(i)
        }
        
        //##########################################################################//
    }
}
