//
//  popBeaconEncontrado.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 16/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class BeaconEncontrado_VC: UIViewController {
    
    private var contenedor:UIView!
    private var img_Becon:UIImageView!
    
    override func viewDidLoad() {
        var superView = self.view.frame
        
        var btn_reg_Entrada = UIButton.buttonWithType(UIButtonType.System) as UIButton
        var btn_reg_Salida = UIButton.buttonWithType(UIButtonType.System) as UIButton
        
        var gestoTap = UITapGestureRecognizer(target: self, action: "desaparecerPopUp")
        
        //************************** Posicion de los wigets **************************//

        contenedor = UIView(frame: CGRect(x: (superView.width - S_CONTENEDOR.width) / 2,
            y: (superView.height - S_CONTENEDOR.height) / 2,
            width: S_CONTENEDOR.width,
            height: S_CONTENEDOR.height))
        
        img_Becon = UIImageView(frame: R_IMG_BECON)
        
        var lbl_popUp = UILabel(frame: R_LBL_POPUP)
        var lbl_hora = UILabel(frame: R_LBL_HORA)
        
        btn_reg_Entrada.frame =  R_INCONO_E
        btn_reg_Salida.frame = R_INCONO_S
        //***************************************************************************//
        
        //######### Personalización de los widgets #########//
        
        img_Becon.backgroundColor = UIColor.greenColor()
        
        lbl_popUp.text =  "Beacon encontrado, marque por favor su \nregistro."

        let dateFormatter = NSDateFormatter()
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle //Set time style
        dateFormatter.timeZone = NSTimeZone()
        
        lbl_hora.text = dateFormatter.stringFromDate(NSDate())//formatemos la fecha
        
        lbl_popUp.font = lbl_popUp.font.fontWithSize(10.0)
        lbl_popUp.textColor = UIColor.grayColor()
        lbl_popUp.numberOfLines = 2
//        lbl_popUp.backgroundColor = UIColor.blueColor()
        
        lbl_hora.textColor = UIColor.redColor()
        lbl_hora.font = lbl_hora.font.fontWithSize(18.0)
        
        btn_reg_Entrada.backgroundColor = UIColor.greenColor()
        btn_reg_Salida.backgroundColor = UIColor.redColor()
        
        btn_reg_Entrada.addTarget(self, action: "registrarEntrada", forControlEvents: .TouchUpInside)
        btn_reg_Salida.addTarget(self, action: "registrarSalida", forControlEvents: .TouchUpInside)
        
        //#############################################//
        
        contenedor.addSubview(img_Becon)
        contenedor.addSubview(lbl_popUp)
        contenedor.addSubview(lbl_hora)
        contenedor.backgroundColor = UIColor.whiteColor()
        contenedor.addSubview(btn_reg_Entrada)
        contenedor.addSubview(btn_reg_Salida)
        
        var algo = UITapGestureRecognizer(target: self, action: "noHaceNada")
        contenedor.addGestureRecognizer(algo)
//        contenedor.userInteractionEnabled = false
        
        self.view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        self.view.addGestureRecognizer(gestoTap)
        self.view.addSubview(contenedor)
        
    }
    
    func desaparecerPopUp(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func noHaceNada(){
        
    }
    
    func registrarEntrada(){
        
    }
    
    func registrarSalida(){
        
    }
}