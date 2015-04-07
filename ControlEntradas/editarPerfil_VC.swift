//
//  editarPerfil_VC.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 06/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit


class editarPerfil_VC: UIViewController {

    override func viewDidLoad(){
        super.viewDidLoad()
        self.title = "✏️Edicción de perfil"
        
        self.navigationController?.navigationBar.barStyle  = UIBarStyle.Black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "〈 Home", style: .Plain, target: self, action: "tapButton")
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.greenColor()
        //        navigationItem.titleView = UIImageView (image: UIImage(named:"testnavbar.png"))
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    func tapButton(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}