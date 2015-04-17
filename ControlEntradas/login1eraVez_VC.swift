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
        
        var registroXEmail = UIButton.buttonWithType(.System) as UIButton
        var registroXPodio = UIButton.buttonWithType(.System) as UIButton
        
        //************************** Posicion de los wigets **************************//

        var img_Empresa = UIImageView(frame: CGRect(x: 0,
                                                    y: superView.width / 2 - 90,
                                                    width: superView.width,
                                                    height: 170))

        registroXEmail.frame = CGRect(  x: superView.width / 2 - 150,
                                        y: superView.maxY - 50,
                                        width: 300,
                                        height: 40)

        registroXPodio.frame = CGRect(  x: registroXEmail.frame.minX,
                                        y: registroXEmail.frame.minY - 50,
                                        width: registroXEmail.frame.width,
                                        height: registroXEmail.frame.height)
        //***************************************************************************//

        //######### Personalización de los widgets #########//

        img_Empresa.backgroundColor = UIColor.grayColor()
        registroXPodio.backgroundColor = UIColor(red: 17/255, green: 129/255, blue: 131/255, alpha: 1.0)
        registroXEmail.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.7, alpha: 1.0)
        //#############################################//
        
        self.view.addSubview(img_Empresa)
        self.view.addSubview(registroXPodio)
        self.view.addSubview(registroXEmail)
    }
}
