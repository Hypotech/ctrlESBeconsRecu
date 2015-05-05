//
//  popBeaconEncontrado.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 16/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

protocol popUpBeaconDelegate{
    func popUpDesaparecera()
}

class BeaconEncontrado_VC: UIViewController {
    
    private var contenedor:UIView!
    var delegado:popUpBeaconDelegate?
    
    override func viewDidLoad() {
        var superView = self.view.frame
        
        var btn_reg_Entrada = UIButton.buttonWithType(UIButtonType.System) as UIButton
        var btn_reg_Salida = UIButton.buttonWithType(UIButtonType.System) as UIButton
        
        //************************** Posicion de los wigets **************************//

        contenedor = UIView(frame: CGRect(x: (superView.width - S_CONTENEDOR.width) / 2,
            y: (superView.height - S_CONTENEDOR.height) / 2,
            width: S_CONTENEDOR.width,
            height: S_CONTENEDOR.height))
        
        var img_FondoContenedor = UIImageView(frame: CGRect(origin: CGPoint.zeroPoint,
                                                                 size: CGSize(width: S_CONTENEDOR.width, height: S_CONTENEDOR.height + 6)))
        
        var img_Becon = UIImageView(frame: R_IMG_BECON)
        
        var lbl_beacon = UILabel(frame: R_LBL_POPUP)
        var lbl_hora = UILabel(frame: R_LBL_HORA)
        
        btn_reg_Entrada.frame =  R_ICONO_E
        btn_reg_Salida.frame  = R_ICONO_S
        
        var lbl_abajo_Entrada = UILabel(frame: R_LBL_A_E)
        var lbl_abajo_Salida  = UILabel(frame: R_LBL_A_S)
        //***************************************************************************//
        
        //######### Personalización de los widgets #########//
        
        img_Becon.image = UIImage(named: "beacon_popup.png")
        
        lbl_beacon.text =  "Beacon encontrado, marque por favor su \nregistro."

        let dateFormatter = NSDateFormatter()
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle //Set time style
        dateFormatter.timeZone = NSTimeZone()
        
        lbl_hora.text = dateFormatter.stringFromDate(NSDate())//formatemos la fecha
        lbl_hora.textColor = naranja_texto
        lbl_hora.font = lbl_hora.font.fontWithSize(18.0)
        
        lbl_beacon.font = lbl_beacon.font.fontWithSize(11.0)
        lbl_beacon.textColor = UIColor.grayColor()
        lbl_beacon.numberOfLines = 2

        
        btn_reg_Entrada.setBackgroundImage(UIImage(named: "icono_entrada.png"), forState: .Normal)
        btn_reg_Entrada.addTarget(self, action: "registrarEntrada", forControlEvents: .TouchUpInside)
        
        btn_reg_Salida.setBackgroundImage(UIImage(named: "icono_salida.png"), forState: .Normal)
        btn_reg_Salida.addTarget(self, action: "registrarSalida", forControlEvents: .TouchUpInside)
        
        lbl_abajo_Entrada.text = "Entrada"
        lbl_abajo_Entrada.textAlignment = .Center
        lbl_abajo_Entrada.font = lbl_abajo_Entrada.font.fontWithSize(11.0)
        lbl_abajo_Entrada.textColor = UIColor.grayColor()
        
        lbl_abajo_Salida.text = "Salida"
        lbl_abajo_Salida.textAlignment = .Center
        lbl_abajo_Salida.font = lbl_abajo_Entrada.font
        lbl_abajo_Salida.textColor = UIColor.grayColor()
        
        img_FondoContenedor.image = UIImage(named: "pop_up.png")
//        img_BackgroungContenedor.backgroundColor = UIColor.greenColor()
//        contenedor.backgroundColor = UIColor.whiteColor()
        //#############################################//

        contenedor.addSubview(img_FondoContenedor)
        contenedor.addSubview(img_Becon)
        contenedor.addSubview(lbl_beacon)
        contenedor.addSubview(lbl_hora)
        contenedor.addSubview(btn_reg_Entrada)
        contenedor.addSubview(lbl_abajo_Entrada)
        contenedor.addSubview(btn_reg_Salida)
        contenedor.addSubview(lbl_abajo_Salida)
        
        var gestoTap = UITapGestureRecognizer(target: self, action: "desaparecerPopUp")
        var algo = UITapGestureRecognizer(target: self, action: "noHaceNada")
        
        contenedor.addGestureRecognizer(algo)
//        contenedor.userInteractionEnabled = false
        
        self.view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        self.view.addGestureRecognizer(gestoTap)
        self.view.addSubview(contenedor)
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        delegado?.popUpDesaparecera()
    }
    
    // MARK: ----------------------------------------
    // MARK: Acciones para la interacción con Buttons
    // MARK: ----------------------------------------
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