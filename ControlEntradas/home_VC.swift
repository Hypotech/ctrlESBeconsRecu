//
//  home_VC.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 01/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit


class home_VC: UIViewController {
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    var logo:logoView!
    var historial: tablaHsitorial!
    var img_usuario = UIImage(named:"user.png")
    var img_fondo = UIImage(named:"nature.png")
    var lbl_nomUsr = UILabel()
    private var btn_Registrar: UIButton!
    var CelEntradasSalidas:[Cell_EntradaSalida] = []
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    override func viewDidLoad() {
        var superView = self.view.frame
        var img_ajustes = UIImage(named:"Settings-icon.png")
        
        //************************** Posicion de los wigets **************************//
        logo = logoView(superVDim: superView)
        
        var btn_ajustes = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn_ajustes.frame = CGRect( x: logo.container.frame.maxX - 40,
                                    y: logo.container.frame.minY + 20,
                                    width: 40,
                                    height: 40)
        
        var contdor_i_fondo = UIImageView(frame: CGRect(x: logo.container.frame.minX,
                                                        y: logo.container.frame.maxY,
                                                        width: logo.container.frame.width,
                                                        height: 120))
        
        var contdor_i_usr = UIImageView(frame: CGRect(  x: logo.container.frame.minX + logo.container.frame.maxX/2 - 60/2,
                                                        y: logo.container.frame.maxY + 25,
                                                        width: 60,
                                                        height: 60))
        
        var btn_edit_perf = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn_edit_perf.frame = (frame: CGRect(   x: contdor_i_usr.frame.maxX,
                                                y: contdor_i_usr.frame.minY,
                                                width: 15,
                                                height: 20))
        var posicion_Historial = superView
        posicion_Historial.origin.y = contdor_i_fondo.frame.maxY
        
        historial = tablaHsitorial(superVDim: posicion_Historial, historial: CelEntradasSalidas)
        
        btn_Registrar = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn_Registrar.frame = CGRect(x: (superView.width - 70 )/2,
            y: historial.view.frame.maxY + 20.0,
            width: 70, height: 35)
        //***************************************************************************//

        //######### Personalización de los widgets #########//
        contdor_i_fondo.image = img_fondo
        contdor_i_usr.image = img_usuario
        
        btn_edit_perf.setBackgroundImage(UIImage(named:"Edit_icon.png"), forState: .Normal)
        btn_edit_perf.addTarget(self, action: "irEditarPerfil", forControlEvents: UIControlEvents.TouchUpInside)
        
        btn_ajustes.setBackgroundImage(img_ajustes, forState: .Normal)
        btn_ajustes.addTarget(self, action: "irAjustes", forControlEvents: UIControlEvents.TouchUpInside)
        
        lbl_nomUsr.text = "Nombre de usuario"
        lbl_nomUsr.textColor = UIColor.lightTextColor()
        lbl_nomUsr.font = lbl_nomUsr.font.fontWithSize(12.0)
//        lbl_nomUsr.backgroundColor = UIColor.blackColor()
        calcularAncho(&lbl_nomUsr)
        lbl_nomUsr.frame.origin = CGPoint(  x: contdor_i_usr.frame.minX +  (contdor_i_usr.frame.width - lbl_nomUsr.frame.width)/2,
                                            y: contdor_i_usr.frame.maxY - 2)
        
        btn_Registrar.backgroundColor = UIColor.blueColor();
        btn_Registrar.setTitle("Registrar", forState: .Normal)
        btn_Registrar.addTarget(self, action: "tapRegistrar", forControlEvents: UIControlEvents.TouchUpInside)
        //#############################################//
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(logo.container)
        self.view.addSubview(contdor_i_usr)
        self.view.addSubview(contdor_i_fondo)
        self.view.addSubview(btn_edit_perf)
        self.view.addSubview(btn_ajustes)
        self.view.addSubview(lbl_nomUsr)
        self.view.addSubview(historial.view)
        self.view.addSubview(btn_Registrar)
    }

    func calcularAncho(inout label:UILabel){
        
        var maximumLabelSize:CGSize = CGSize(width: label.frame.width, height: 15)
        var expectSize:CGSize = label.sizeThatFits(maximumLabelSize)
        
//        var newFrame = label.frame
//        newFrame.size.width = expectSize.width //cambia solo el ancho
        label.frame.size = expectSize
    }
    
    // MARK: ----------------------------------------
    // MARK: Acciones para la interacción con Buttons
    // MARK: ----------------------------------------
    
    func irEditarPerfil(){
        var editPerfViewCtrl = editarPerfil_VC()
        //Se agrega una animación entre su transición
//        editPerfViewCtrl.modalPresentationStyle = .OverFullScreen
//        editPerfViewCtrl.modalTransitionStyle = .CrossDissolve
        
        var navController = UINavigationController(rootViewController: editPerfViewCtrl)
        
        //        navController.transitioningDelegate = self.animator! //agregar una animación personalizada
        self.presentViewController(navController, animated: true, completion: nil)
    }
    
    func irAjustes(){
        var ajustesViewCtrl = ajustes_VC()
        //Se agrega una animación entre su transición
//        ajustesViewCtrl.modalPresentationStyle = .OverFullScreen
//        ajustesViewCtrl.modalTransitionStyle = .CrossDissolve
        
        var navController = UINavigationController(rootViewController: ajustesViewCtrl)
        
        //        navController.transitioningDelegate = self.animator! //agregar una animación personalizada
        self.presentViewController(navController, animated: true, completion: nil)
    }
    
    func tapRegistrar() {
        
    }
}