//
//  home_VC.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 01/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit


class home_VC: UIViewController, ajustesDelgate {
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    var historial: tablaAnualHsitorial!
//    var img_fondo = UIImage(named:"nature.png")
    var lbl_nomUsr = UILabel()
//    private var btn_Registrar: UIButton!
    var CelEntradasSalidas:[Cell_EntradaSalida] = []
    var img_usuario:UIImageView!
    var infoPerfil:Perfil = Perfil()
    var podio: PKTClient!
    var previousVC:UIViewController!
    
    private var btn_beacon:UIButton!
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    
    override func viewDidLoad() {
        var superView = self.view.frame
        
        //************************** Posicion de los wigets **************************//
        
//        var contdor_i_mascara = UIImageView(frame: CGRect(x: logo.container.frame.minX,
//                                                        y: logo.container.frame.maxY,
//                                                        width: logo.container.frame.width,
//                                                        height: 120))
        
        img_usuario = UIImageView(frame: CGRect(x: 0,
                                                y: 0,
                                                width: superView.width,
                                                height: ALTURA_IMG_USR))
        
        var btn_edit_perf = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn_edit_perf.frame = (frame: CGRect(   x: img_usuario.frame.minX + 20,
                                                y: img_usuario.frame.minY + 30,
                                                width: 15,
                                                height: 20))
        
        var btn_ajustes = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn_ajustes.frame = CGRect( x: img_usuario.frame.maxX - 60,
                                    y: btn_edit_perf.frame.minY,
                                    width: 40,
                                    height: 40)

        btn_beacon =  UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn_beacon.frame = CGRect(x: img_usuario.frame.minX + (img_usuario.frame.width - S_IMG_BEACON.width)  / 2,
                                  y: img_usuario.frame.maxY - S_IMG_BEACON.height / 2,
                                  width: S_IMG_BEACON.width,
                                  height: S_IMG_BEACON.height)

        var posicion_Historial = CGRect(x: 0,
                                        y: btn_beacon.frame.maxY,
                                        width: superView.width,
                                        height: superView.height - btn_beacon.frame.maxY )
        
        historial = tablaAnualHsitorial(ubicacion: posicion_Historial)
        
        //***************************************************************************//

        //######### Personalización de los widgets #########//
//        contdor_i_fondo.image = img_fondo
        llenarConPerfil()
        btn_edit_perf.setBackgroundImage(UIImage(named:"Edit_icon.png"), forState: .Normal)
        btn_edit_perf.addTarget(self, action: "irEditarPerfilEscena", forControlEvents: UIControlEvents.TouchUpInside)
        
        btn_ajustes.setBackgroundImage(UIImage(named:"Settings-icon.png"), forState: .Normal)
        btn_ajustes.addTarget(self, action: "irAjustesEscena", forControlEvents: UIControlEvents.TouchUpInside)
        
        lbl_nomUsr.textColor = UIColor.whiteColor()
        lbl_nomUsr.font = UIFont(name: "NexaBold", size: 13.0)
        
        img_usuario.backgroundColor = UIColor.grayColor()
        
        btn_beacon.backgroundColor = UIColor.greenColor()
        btn_beacon.addTarget(self, action: "btnBeconPresionado", forControlEvents: .TouchUpInside)
        btn_beacon.setTitle("Beacon", forState: .Normal)
        
//        btn_Registrar.backgroundColor = UIColor.blueColor();
//        btn_Registrar.setTitle("Registrar", forState: .Normal)
//        btn_Registrar.addTarget(self, action: "tapRegistrar", forControlEvents: UIControlEvents.TouchUpInside)
        //#############################################//
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(img_usuario)
//        self.view.addSubview(contdor_i_mascara)
        self.view.addSubview(btn_edit_perf)
        self.view.addSubview(btn_ajustes)
        self.view.addSubview(lbl_nomUsr)
        self.view.addSubview(historial.view)
        self.view.addSubview(btn_beacon)
//        self.view.addSubview(btn_Registrar)
    }

    func calcularAncho(inout label:UILabel){
        
        var maximumLabelSize:CGSize = CGSize(width: label.frame.width, height: 15)
        var expectSize:CGSize = label.sizeThatFits(maximumLabelSize)
        
        label.frame.size = expectSize
        
        label.frame.origin = CGPoint(  x: img_usuario.frame.minX +  (img_usuario.frame.width - lbl_nomUsr.frame.width) / 2,
            y: img_usuario.frame.maxY / 2 + 20)
    }
    
    // MARK: ----------------------------------------
    // MARK: Acciones para la interacción con Buttons
    // MARK: ----------------------------------------
    
    func irEditarPerfilEscena(){
        var editPerfViewCtrl = editarPerfil_VC()
        editPerfViewCtrl.podio = self.podio
        
        //Se agrega una animación entre su transición
//        editPerfViewCtrl.modalPresentationStyle = .OverFullScreen
//        editPerfViewCtrl.modalTransitionStyle = .CrossDissolve
        
        var navController = UINavigationController(rootViewController: editPerfViewCtrl)
        
        //        navController.transitioningDelegate = self.animator! //agregar una animación personalizada
        self.presentViewController(navController, animated: true, completion: nil)
    }
    
    func irAjustesEscena(){
        var ajustesViewCtrl = ajustes_VC()
        ajustesViewCtrl.delegado = self
        ajustesViewCtrl.ref_loginVC = self.previousVC
        
        //Se agrega una animación entre su transición
//        ajustesViewCtrl.modalPresentationStyle = .OverFullScreen
//        ajustesViewCtrl.modalTransitionStyle = .CrossDissolve
        
        var navController = UINavigationController(rootViewController: ajustesViewCtrl)
        
        //        navController.transitioningDelegate = self.animator! //agregar una animación personalizada
        self.presentViewController(navController, animated: true, completion: nil)
    }
    
    func tapRegistrar() {
        
    }
    
    func obtenerPerfil(){
        
        podio.performRequest(PKTUserAPI.requestForUserStatus(), completion: {
            (respuesta,error) -> () in
            
            let profile:AnyObject? = respuesta.body.objectForKey("profile")
            
            if !(profile is NSNull){
                let image: AnyObject? = profile!.objectForKey("image")
                if !(image is NSNull){
                    let link: AnyObject? = image!.objectForKey("link")
                    if !(link is NSNull){
                        
                        var cadena = link as NSString
                        
                        var data = NSData(contentsOfURL: NSURL(string: cadena)!)
                        self.img_usuario.image = UIImage(data: data!)
                        
                        println("Se ha cargado la imagen")
                    }
                }
                
                let nombre: AnyObject? = profile!.objectForKey("name")
                if !(nombre is NSNull){
                    self.infoPerfil.nombre = nombre as NSString
                    
                    println(nombre as NSString)
                    
                    self.lbl_nomUsr.text = self.infoPerfil.nombre
                    self.lbl_nomUsr.text = self.lbl_nomUsr.text?.capitalizedString
                    self.calcularAncho(&(self.lbl_nomUsr))
                }
                
                let telefono: AnyObject? = profile!.objectForKey("phone")
                println("telefono: \(telefono)")
                if !(telefono is NSNull) && telefono != nil{
                    self.infoPerfil.telefono = telefono as NSArray
                }
                
                let email: AnyObject? = profile!.objectForKey("mail")
                if !(email is NSNull) && email != nil {
                    self.infoPerfil.email = email! as NSArray
                    println("\(self.infoPerfil.email)")
                }
//                let id_org: AnyObject? = profile!.objectForKey("org_id")
//                println("organizacion: \(id_org)")
//                if !(id_org is NSNull){
//                    println("no es NSnull")
//                    self.infoPerfil.empresa = id_org! as NSString
//                    
//                    PKTOrganization.fetchAllWithCompletion({(organizaciones,error) -> () in
//                        
//                    })
//                }
                return
            }
            self.img_usuario.image = UIImage(named:"smile-icon.png") //si no tiene imagen asignada se pone una por defecto
            println("No se pudo cargar imagen")
            
        })
        
    }
    
    func llenarConPerfil(){
        img_usuario.image = infoPerfil.imagenUsuario
        lbl_nomUsr.text = infoPerfil.nombre.uppercaseString
        
        calcularAncho(&(self.lbl_nomUsr))
    }
    
    func btnBeconPresionado(){
        var popUp = BeaconEncontrado_VC()
        popUp.modalPresentationStyle = .OverFullScreen
        popUp.modalTransitionStyle = .CrossDissolve
        
        self.presentViewController(popUp, animated: true, completion: nil)
    }
    
    func logout(){
        println("logout presionado")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}