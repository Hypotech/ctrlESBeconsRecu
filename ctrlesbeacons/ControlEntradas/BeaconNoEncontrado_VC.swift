//
//  BeaconNoEncontrado_VC.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 05/05/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class BeaconNoEncontrado_VC: UIViewController {
    
    private var contenedor:UIView!
    var delegado:popUpBeaconDelegate?
    
    override func viewDidLoad() {
        
        var superView = self.view.frame
        
        //************************** Posicion de los wigets **************************//
        
        contenedor = UIView(frame: CGRect(x: (superView.width - S_CONTENEDOR.width) / 2,
            y: (superView.height - S_CONTENEDOR.height) / 2,
            width: S_CONTENEDOR.width,
            height: S_CONTENEDOR.height))
        
        var img_FondoContenedor = UIImageView(frame: CGRect(origin: CGPoint.zeroPoint,
            size: CGSize(width: S_CONTENEDOR.width, height: S_CONTENEDOR.height + 6)))
        
        //***************************************************************************//
        
        //######### Personalización de los widgets #########//
        
        img_FondoContenedor.image = UIImage(named: "pop_up.png")
        //#############################################//
        
        var gestoTap = UITapGestureRecognizer(target: self, action: "desaparecerPopUp")
        var algo = UITapGestureRecognizer(target: self, action: "noHaceNada")
        
        contenedor.addSubview(img_FondoContenedor)
        
        self.view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        self.view.addSubview(contenedor)
        self.view.addGestureRecognizer(gestoTap)
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
}