//
//  login1eraVez_VC.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 17/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class login1eraVez_VC: UIViewController {
    
    override func viewDidLoad() {
        var superView = self.view.frame
        
        
        //************************** Posicion de los wigets **************************//

        var img_Empresa = UIImageView(frame: CGRect(x: 55,
                                                    y: superView.width / 2 - 50,
                                                    width: superView.width - 110,
                                                    height: 100))

        var btn_registroXEmail = UIButton(frame:CGRect(
                                                x: (superView.width - S_REG_EMAIL.width) / 2 ,
                                                y: superView.maxY - S_REG_EMAIL.height * 2 - 30,
                                                width: S_REG_EMAIL.width,
                                                height: S_REG_EMAIL.height))

        var btn_registroXPodio = UIButton(frame:CGRect( origin:
                    CGPoint(x: btn_registroXEmail.frame.minX,
                            y: btn_registroXEmail.frame.minY - S_REG_PODIO.height - 10 ),
                                                        size: S_REG_PODIO))
        
        var btn_ingresar = UIButton(frame: CGRect(origin:
                                    CGPoint(x: btn_registroXEmail.frame.minX,
                                            y: btn_registroXEmail.frame.maxY + 10),
                                                  size: S_REG_PODIO))
        
        //***************************************************************************//

        //################################# Personalización de los widgets ##############################//

        img_Empresa.image = UIImage(named: "Logo_republica.png")

        btn_registroXPodio.setImage(UIImage(named:"boton_podio.png"), forState: .Normal)
        btn_registroXPodio.setImage(UIImage(named:"boton_podio_on.png"), forState: .Highlighted)
        btn_registroXPodio.addTarget(self, action: "ingresar", forControlEvents: .TouchUpInside)
        
        btn_registroXEmail.setImage(UIImage(named:"boton_mail.png"), forState: .Normal)
        btn_registroXEmail.setImage(UIImage(named:"boton_mail_on.png"), forState: .Highlighted)
        btn_registroXEmail.addTarget(self, action: "resgitarxEmail", forControlEvents: .TouchUpInside)
        
        var atributos =  [  NSUnderlineStyleAttributeName : NSUnderlineStyle.StyleSingle.rawValue,
                            NSForegroundColorAttributeName: UIColor.blueColor() ]
        
        var cadenaForamteada = NSMutableAttributedString(string: "INGRESAR", attributes:atributos)
        
        btn_ingresar.setAttributedTitle(cadenaForamteada, forState: .Normal)
        btn_ingresar.addTarget(self, action: "ingresar", forControlEvents: .TouchUpInside)
        //############################################################################################//
        
        self.view.addSubview(img_Empresa)
        self.view.addSubview(btn_registroXPodio)
        self.view.addSubview(btn_registroXEmail)
        self.view.addSubview(btn_ingresar)
    }
    
    func ingresar(){
        
        var loginViewCtrl = login_VC()

        loginViewCtrl.modalTransitionStyle = .CrossDissolve
        
        self.presentViewController(loginViewCtrl, animated: true, completion: nil)
    }
    
    func resgitarxEmail(){
        var regEmail_VC = registroEmail_VC()
        
        regEmail_VC.modalTransitionStyle = .CrossDissolve
        
        self.presentViewController(regEmail_VC, animated: true, completion: nil)
    }
}
