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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "⚙Ajustes"
        var superVDim = self.view.frame
        
        self.navigationController?.navigationBar.barStyle  = UIBarStyle.Black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "〈 Inicio", style: .Plain, target: self, action: "irAInicio")
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.greenColor()
        
        var btn_logout  = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn_logout.frame = CGRect(  x: (superVDim.width - 70)/2,
                                    y: (superVDim.height - 20)/2,
                                    width: 70,
                                    height: 30)
        
        btn_logout.backgroundColor = UIColor.blueColor();
        btn_logout.setTitle("Logout", forState: .Normal)
        btn_logout.addTarget(self, action: "tapLogout", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.backgroundColor = UIColor.whiteColor()
        podio =  PKTClient.sharedClient()
        
        self.view.addSubview(btn_logout)
    }
    
    // MARK: ----------------------------------------
    // MARK: Acciones para la interacción con Buttons
    // MARK: ----------------------------------------
    
    
    func irAInicio(){
        self.dismissViewControllerAnimated(true, completion: nil) //regresa al viewController anterior (inicio)
    }
    
    func tapLogout() {
        ref_loginVC.dismissViewControllerAnimated(true, completion: nil) //ir al viewController de login
    }
}