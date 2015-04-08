//
//  ajustes_VC.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 06/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit


class ajustes_VC:UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "⚙Ajustes"
        var superVDim = self.view.frame

        self.navigationController?.navigationBar.barStyle  = UIBarStyle.Black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "〈 Home", style: .Plain, target: self, action: "NavLeftButton")
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.greenColor()
//        navigationItem.titleView = UIImageView (image: UIImage(named:"testnavbar.png"))
        
        
        var btn_logout  = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn_logout.frame = CGRect(  x: (superVDim.width - 70)/2,
                                    y: (superVDim.height - 20)/2,
                                    width: 70,
                                    height: 30)
        btn_logout.backgroundColor = UIColor.blueColor();
        btn_logout.setTitle("Logout", forState: .Normal)
        btn_logout.addTarget(self, action: "tapLogout", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(btn_logout)
    }
    
    // MARK: ----------------------------------------
    // MARK: Acciones para la interacción con Buttons
    // MARK: ----------------------------------------
    
    
    func NavLeftButton(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tapLogout() {
        
    }
}