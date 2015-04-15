//
//  historial_VC.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 31/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit


class historial_VC:UIViewController{
    var tabla:tablaMensualHsitorial!
    var celdaEntradasSalidas:[Cell_EntradaSalida] = []
    
//    var ArrayE_S:[Cell_EntradaSalida]{
//        get{
//            return celdaEntradasSalidas
//
//        }
//        set{
//            celdaEntradasSalidas = newValue
//        }
//    }
    
    override func viewDidLoad() {
        var superDimensiones = self.view.frame
        self.title = "🕖historial"
//        var customTitle = UIView(frame: CGRect(x: 0, y: 0, width: 350, height: 70))
//        customTitle.backgroundColor = UIColor.lightGrayColor()
//        
//        var titleText = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
//        titleText.text = "🕖historial"
//        
//        var titleImage = UIImageView (frame: CGRect(x: 0, y: 0, width: customTitle.frame.width, height: 70))
//        titleImage.image =  UIImage( named: "testnavbar.png")
//        
//        customTitle.addSubview(titleImage)
//        customTitle.addSubview(titleText)
//        navigationItem.titleView = customTitle

        getHistorial()

        self.navigationController?.navigationBar.barStyle  = UIBarStyle.Black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "〈 Perfiles", style: .Plain, target: self, action: "tapButton")
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.greenColor()
        navigationItem.titleView = UIImageView (image: UIImage(named:"testnavbar.png"))
        
        superDimensiones.origin.y = self.navigationController!.navigationBar.frame.maxY
//        tabla = tablaMensualHsitorial(ubicacion: superDimensiones, historial: celdaEntradasSalidas)

        self.view.backgroundColor = UIColor.whiteColor()
//        self.view.addSubview(tabla.view)
    }
    

    
    // MARK: ----------------------------------------
    // MARK: Acciones para la interacción con Buttons
    // MARK: ---------------------------------------
    func tapButton(){
                self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: -----------------
    // MARK: Obtecion de datos
    // MARK: -----------------
    func getHistorial(){
        celdaEntradasSalidas.append(Cell_EntradaSalida(style: .Default, reuseIdentifier: "MyCustES"))
        
    }
}