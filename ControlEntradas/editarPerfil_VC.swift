//
//  editarPerfil_VC.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 06/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit


class editarPerfil_VC: UIViewController {
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    var viewBar:UIView!
    var lbl_title:UILabel!
    var infoUsuario:tablaConfig!
    var Podio:PKTClient!
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    override func viewDidLoad(){
        super.viewDidLoad()
        var superVDim = self.view.frame
        
        self.navigationController?.navigationBar.barStyle  = UIBarStyle.Black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "〈 Home", style: .Plain, target: self, action: "tapButton")
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.greenColor()
        navigationItem.title = "✏️Edicción de perfil"
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"testnavbar.png"), forBarMetrics: .Default)
        
        
//        viewBar = UIView(frame: CGRect(x: 0, y: 8, width: 130, height: 80))
//        
//        var img_logo =  UIImageView (image: UIImage(named:"testnavbar.png"))
//        img_logo.frame = CGRect(x: viewBar.frame.minX,
//                                y: viewBar.frame.minY,
//                                width: viewBar.frame.width,
//                                height: 42)
//        
//        lbl_title = UILabel(frame: CGRect(  x: viewBar.frame.minX,
//                                            y: viewBar.frame.minY + 15,
//                                            width: 130,
//                                            height: 20))
//        lbl_title.font = lbl_title.font.fontWithSize(13.0)
//        lbl_title.text = "✏️Editando perfil"
//        lbl_title.textColor = UIColor.blackColor()
//        
//        viewBar.addSubview(img_logo)
//        viewBar.addSubview(lbl_title)
//        navigationItem.titleView = viewBar
        
        var ubicTabla = superVDim
        ubicTabla.origin.y = self.navigationController!.navigationBar.frame.maxY + 20
        Podio =  PKTClient.sharedClient()
        
        println("La altura del navigatioCtrl: \(ubicTabla.origin.y - 20)")
        
        infoUsuario = tablaConfig(superVDim: ubicTabla)
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(infoUsuario.viewTabla)
    }
    
    func tapButton(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func foo(){
        
//        let profile: AnyObject? = respuesta.body.objectForKey("profile")
//        
//        if profile != nil{
//            let image: AnyObject? = profile!.objectForKey("image")
//            if image != nil{
//                let link: AnyObject? = image!.objectForKey("link")
//                if link != nil{
//                }
//            }
//        }
    }
}