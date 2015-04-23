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

        var registroXEmail = UIButton(frame:CGRect(x: (superView.width - S_REG_EMAIL.width) / 2 ,
                                                   y: superView.maxY - S_REG_EMAIL.height - 30,
                                                   width: S_REG_EMAIL.width,
                                                   height: S_REG_EMAIL.height))

        var EntrarXPodio = UIButton(frame:CGRect(origin: CGPoint(x: registroXEmail.frame.minX,
                                      y: registroXEmail.frame.minY - S_REG_PODIO.height - 10),
                                                 size: S_REG_PODIO))
        
        //***************************************************************************//

        //######### Personalización de los widgets #########//

        img_Empresa.image = UIImage(named: "Logo_republica.png")

        EntrarXPodio.setImage(UIImage(named:"boton_podio.png"), forState: .Normal)
        EntrarXPodio.setImage(UIImage(named:"boton_podio_on.png"), forState: .Highlighted)
        EntrarXPodio.addTarget(self, action: "loginxPodio", forControlEvents: .TouchUpInside)
        
        registroXEmail.setImage(UIImage(named:"boton_mail.png"), forState: .Normal)
        registroXEmail.setImage(UIImage(named:"boton_mail_on.png"), forState: .Highlighted)
        //#############################################//
        
        self.view.addSubview(img_Empresa)
        self.view.addSubview(EntrarXPodio)
        self.view.addSubview(registroXEmail)
    }
    
    func loginxPodio(){
        var loginPodio_VC = login_VC()
//        loginPodio_VC.modalPresentationStyle = .OverFullScreen
        loginPodio_VC.modalTransitionStyle = .CrossDissolve
        
        self.presentViewController(loginPodio_VC, animated: true, completion: nil)
    }
}
