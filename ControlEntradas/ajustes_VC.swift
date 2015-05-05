//
//  ajustes_VC.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 06/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class ajustes_VC:UIViewController {

    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    var podio:PKTClient!
    var ref_loginVC:UIViewController! //referencia a login_VC
    
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let superVDim = self.view.frame
        podio =  PKTClient.sharedClient()
        
        //****************************** Posicion de los wigets ******************************//    
        
        var img_fondo = UIImageView(frame:CGRect( origin:
                                    CGPoint (x: superVDim.maxX - S_IMG_FONDO.width - (30 - 25),
                                             y: 10),
                                                  size: S_IMG_FONDO))
        
        var img_icono_engrane = UIImageView(frame: CGRect( origin: CGPoint( x: superVDim.maxX - 50,
                                                                            y: 30),
                                                            size: S_BTN_AJUS))
        
        var btn_logout  = UIButton.buttonWithType(UIButtonType.System) as UIButton
        
        let altoXBoton:CGFloat =  42//img_fondo.frame.height / 4 - 24
        let offset:CGFloat = 9.6
        
        btn_logout.frame = CGRect(x: offset,
                y: img_fondo.frame.maxY - altoXBoton - 24,
                width: img_fondo.frame.width - offset*2,
                height: altoXBoton)

        
        var btn_contacto = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn_contacto.frame = CGRect(origin: CGPoint(x: btn_logout.frame.minX,
                                                    y: btn_logout.frame.minY - altoXBoton - 9),
                                    size: btn_logout.frame.size)
        
        
        var btn_avisoPriva = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn_avisoPriva.frame = CGRect(origin: CGPoint ( x: btn_contacto.frame.minX,
                                                        y: btn_contacto.frame.minY - altoXBoton - 12),
                                      size: btn_contacto.frame.size)
        
        
        var btn_TerminosCond = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn_TerminosCond.frame = CGRect(origin: CGPoint(x: btn_avisoPriva.frame.minX,
                                                        y: btn_avisoPriva.frame.minY - altoXBoton - 10),
                                        size: btn_avisoPriva.frame.size)
        
        //***********************************************************************************//

        //######################### Personalización de los widgets #########################//
        
        img_icono_engrane.image = UIImage(named: "boton_configuracion_on.png")
        
//        btn_logout.backgroundColor = UIColor(red: 0.4, green: 0.1, blue: 0.6, alpha: 0.6);
        btn_logout.setTitle("Logout", forState: .Normal)
        btn_logout.addTarget(self, action: "realizarLogout", forControlEvents: UIControlEvents.TouchUpInside)
        
        
//        btn_contacto.backgroundColor = UIColor(red: 0.3, green: 0.5, blue: 0.6, alpha: 0.6);
        btn_contacto.setTitle("Contacto", forState: .Normal)
        btn_contacto.addTarget(self, action: "irContacto", forControlEvents: UIControlEvents.TouchUpInside)
        
//        btn_avisoPriva.backgroundColor = UIColor(red: 0.1, green: 0.5, blue: 0.2, alpha: 0.6);
        btn_avisoPriva.setTitle("Aviso de Privacidad", forState: .Normal)
        btn_avisoPriva.addTarget(self, action: "irAvisoPrivacidad", forControlEvents: UIControlEvents.TouchUpInside)
        
//        btn_TerminosCond.backgroundColor = UIColor(red: 0.7, green: 0.5, blue: 0.2, alpha: 0.6);
        btn_TerminosCond.setTitle("Terminos y Condiciones", forState: .Normal)
        btn_TerminosCond.addTarget(self, action: "irTerminosCondiciones", forControlEvents: UIControlEvents.TouchUpInside)
        
        var gestoTap = UITapGestureRecognizer(target: self, action: "desaparecerPopUp")
        var algo = UITapGestureRecognizer(target: self, action: "noHaceNada")

//        img_fondo.backgroundColor = UIColor.redColor()
        img_fondo.userInteractionEnabled = true
        img_fondo.image = UIImage(named: "ajustes_popup.png")
        img_fondo.addGestureRecognizer(algo)
        img_fondo.addSubview(btn_logout)
        img_fondo.addSubview(btn_contacto)
        img_fondo.addSubview(btn_avisoPriva)
        img_fondo.addSubview(btn_TerminosCond)

        
        self.view.backgroundColor = UIColor(red: 0.5, green: 0.50, blue: 0.50, alpha: 0.5)
        //##################################################################################//
        
//        self.view.addSubview(btn_logout)
        self.view.addGestureRecognizer(gestoTap)
        self.view.addSubview(img_fondo)
        self.view.addSubview(img_icono_engrane)
    }
    
    // MARK: ----------------------------------------
    // MARK: Acciones para la interacción con Buttons
    // MARK: ----------------------------------------
    
    
    func irAInicio(){
        self.dismissViewControllerAnimated(true, completion: nil) //regresa al viewController anterior (inicio)
    }
    
    func realizarLogout() {
        ref_loginVC.dismissViewControllerAnimated(true, completion: nil) //ir al viewController de login
    }
    
    func irContacto(){
        
        var contacto_VC = Contacto_VC()
        
        contacto_VC.modalPresentationStyle = .OverFullScreen
        contacto_VC.modalTransitionStyle = .CrossDissolve
        
        self.presentViewController(contacto_VC, animated: true, completion: nil)
    }
    
    func irAvisoPrivacidad(){
        
        var avisoPriva_VC = AvisoPrivacidad_VC()
        
        avisoPriva_VC.modalPresentationStyle = .OverFullScreen
        avisoPriva_VC.modalTransitionStyle = .CrossDissolve
        
        self.presentViewController(avisoPriva_VC, animated: true, completion: nil)
    }
    
    func irTerminosCondiciones(){
        
        var termYcond_VC = TerminosYCondiciones_VC()
        
        termYcond_VC.modalPresentationStyle = .OverFullScreen
        termYcond_VC.modalTransitionStyle = .CrossDissolve
        
        self.presentViewController(termYcond_VC, animated: true, completion: nil)
    }
    
    // MARK: ----------------------------------------
    // MARK: Acciones para la interacción con gestos
    // MARK: ----------------------------------------
    
    func desaparecerPopUp(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func noHaceNada(){
        
    }
}