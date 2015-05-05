/*  Este viewController es el mostrado después de que le usuario se ha logueado coorectamente,
*   aquí el usuario puede consultar su historial que tenga disponible hasta el momento.
*   Este viewController despliega los viewsControllers:  editarPerfil_VC
*
*  Created by desarrolloRM on 01/04/15.
*  Copyright (c) 2015 Desarrollo RM. All rights reserved.
*/

import UIKit


class inicio_VC: UIViewController,perfilCambiosDelegate,beaconRepublicaDelegate,popUpBeaconDelegate{
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    var podio: PKTClient!
    var infoPerfil:Perfil = Perfil()
    var VC_anterior:UIViewController!
    var CelEntradasSalidas:[Cell_EntradaSalida] = []
    
    private var btn_beacon:UIButton!
    private var lbl_nomUsr = UILabel()
    private var historial: tablaAnualHsitorial!
    private var view_usuario:usuario_View!
    
    private var manejaBeacon:beaconManipulador!
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    
    override func viewDidLoad() {
        var superVDim = self.view.frame
        
        //****************************** Posicion de los wigets ******************************//
        
        view_usuario = usuario_View(ubicacion: CGRect(x: 0,
                                                      y: 0,
                                                      width: superVDim.width,
                                                      height: P_ALT_IMG_USR * superVDim.height))
        
        var btn_edit_perf = UIButton(frame: CGRect(origin: CGPoint( x: 20,
                                                                    y: 30),
                                                   size: S_BTN_EPER))
        
        var btn_ajustes = UIButton(frame:CGRect(origin: CGPoint(
                                                            x: view_usuario.container.frame.maxX - 50,
                                                            y: btn_edit_perf.frame.minY),
                                                size:   S_BTN_AJUS))

        btn_beacon = UIButton(frame: CGRect(origin: CGPoint(
            x: view_usuario.container.frame.minX + (view_usuario.container.frame.width - S_IMG_BEACON.width)  / 2,
            y: view_usuario.container.frame.maxY - S_IMG_BEACON.height / 2),
                                            size: S_IMG_BEACON))

        var posicion_Historial = CGRect(x: 0,
                                        y: btn_beacon.frame.maxY,
                                        width: superVDim.width,
                                        height: superVDim.height - btn_beacon.frame.maxY )
        
        historial = tablaAnualHsitorial(ubicacion: posicion_Historial)
        
        manejaBeacon = beaconManipulador()

        //***********************************************************************************//

        //######################### Personalización de los widgets #########################//
        lbl_nomUsr.font = UIFont(name: "NexaBold", size: 15.0)
        lbl_nomUsr.textColor = UIColor.whiteColor()
        lbl_nomUsr.shadowColor = UIColor.blackColor()
        lbl_nomUsr.shadowOffset = CGSize(width: 1, height: 1)
        
        llenarConPerfil()
        btn_edit_perf.setImage(UIImage(named:"boton_editar.png"), forState: .Normal)
        btn_edit_perf.setImage(UIImage(named:"boton_editar_on.png"), forState: .Highlighted)
        btn_edit_perf.addTarget(self, action: "irEditarPerfilEscena", forControlEvents: UIControlEvents.TouchUpInside)
        
        btn_ajustes.setImage(UIImage(named:"boton_configuracion.png"), forState: .Normal)
        btn_ajustes.setImage(UIImage(named:"boton_configuracion_on.png"), forState: .Highlighted)
        btn_ajustes.addTarget(self, action: "irAjustesEscena", forControlEvents: UIControlEvents.TouchUpInside)
        
        btn_beacon.addTarget(self, action: "buscarBeacon", forControlEvents: .TouchUpInside)
        btn_beacon.setImage(UIImage(named: "boton_buscar.png"), forState: .Normal)
        btn_beacon.setImage(UIImage(named: "boton_buscar_on.png"), forState: .Highlighted)
        //##################################################################################//
        
        manejaBeacon.delegado = self
        println("cargo vista")
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(view_usuario.container)
        self.view.addSubview(btn_edit_perf)
        self.view.addSubview(btn_ajustes)
        self.view.addSubview(lbl_nomUsr)
        self.view.addSubview(historial.view)
        self.view.addSubview(btn_beacon)
    }

    func calcularAncho(inout label:UILabel){
        
        var maximumLabelSize:CGSize = CGSize(width: label.frame.width, height: 15)
        var expectSize:CGSize = label.sizeThatFits(maximumLabelSize)
        
        label.frame.size = expectSize
        
        label.frame.origin = CGPoint(  x: view_usuario.container.frame.minX +  (view_usuario.container.frame.width - lbl_nomUsr.frame.width) / 2,
            y: view_usuario.container.frame.maxY / 2 + 20)
    }
    
    // MARK: ----------------------------------------
    // MARK: Acciones para la interacción con Buttons
    // MARK: ----------------------------------------
    
    func irEditarPerfilEscena(){
        var editPerfViewCtrl = editarPerfil_VC()
        editPerfViewCtrl.podio = self.podio
        editPerfViewCtrl.delegado = self
        
        //Se agrega una animación entre su transición
        editPerfViewCtrl.modalPresentationStyle = .OverFullScreen
        editPerfViewCtrl.modalTransitionStyle = .CrossDissolve
        
//        var navController = UINavigationController(rootViewController: editPerfViewCtrl)
        
        //        navController.transitioningDelegate = self.animator! //agregar una animación personalizada
        self.presentViewController(editPerfViewCtrl, animated: true, completion: nil)
    }
    
    func irAjustesEscena(){
        var ajustesViewCtrl = ajustes_VC()
        ajustesViewCtrl.ref_loginVC = self.VC_anterior
        
        //Se agrega una animación entre su transición
        ajustesViewCtrl.modalPresentationStyle = .OverFullScreen
        ajustesViewCtrl.modalTransitionStyle = .CrossDissolve
        
//        var navController = UINavigationController(rootViewController: ajustesViewCtrl)
        
        //        navController.transitioningDelegate = self.animator! //agregar una animación personalizada
        self.presentViewController(ajustesViewCtrl, animated: true, completion: nil)
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
                        self.view_usuario.setUsuario(UIImage(data: data!)!)
                        
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

                return
            }
            println("Imposible obtener perfil")
            
        })
        
    }
    
    func llenarConPerfil(){
        view_usuario.setUsuario(infoPerfil.imagenUsuario)
        lbl_nomUsr.text = infoPerfil.nombre.uppercaseString
        
        calcularAncho(&(self.lbl_nomUsr))
    }
    
    func buscarBeacon(){

        if presentadoPopup == false {
            
            if manejaBeacon.hayBeacon == true{

                var popUp = BeaconEncontrado_VC()
                popUp.modalPresentationStyle = .OverFullScreen
                popUp.modalTransitionStyle = .CrossDissolve
                
                popUp.delegado = self
                
                self.presentViewController(popUp, animated: true, completion: nil)
                presentadoPopup = true
            }
            else{
                
                var popUp = BeaconNoEncontrado_VC()
                popUp.modalPresentationStyle = .OverFullScreen
                popUp.modalTransitionStyle = .CrossDissolve
                
                popUp.delegado = self
                
                self.presentViewController(popUp, animated: true, completion: nil)
                presentadoPopup = true
            }
        }
    }
    
    // MARK: -------------------------------------------------
    // MARK: Funciones para la interacción con editarPerfil_VC
    // MARK: -------------------------------------------------
    
    func actualizarPerfil(datosPerfil:Perfil){
        infoPerfil = datosPerfil
        view_usuario.setUsuario(infoPerfil.imagenUsuario)
        
        var documentDirectorio = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) [0] as NSString
        
        var rutaArchivoPNG = NSString(format: "%@/test.png", documentDirectorio)
        println("la ruta es: \(rutaArchivoPNG)")
        
        var ImagenData = UIImagePNGRepresentation(infoPerfil.imagenUsuario)
        ImagenData.writeToFile(rutaArchivoPNG, atomically: true)

    }
    
    // MARK: -------------------------------------------------
    // MARK: Funciones para personalizar el view controller
    // MARK: -------------------------------------------------
    override func preferredStatusBarStyle() -> UIStatusBarStyle{
        
        return .LightContent
    }
    
    // MARK: -------------------------------------------------
    // MARK: Funciones delgadas para responder al Beacon
    // MARK: -------------------------------------------------
    
    private var presentadoPopup = false
    
    func foo(){
        
        if presentadoPopup == false{
            var popUp = BeaconEncontrado_VC()
            popUp.modalPresentationStyle = .OverFullScreen
            popUp.modalTransitionStyle = .CrossDissolve
            
            popUp.delegado = self
            
            self.presentViewController(popUp, animated: true, completion: nil)
            presentadoPopup = true
        }
    }
    
    // MARK: -------------------------------------------------
    // MARK: Funciones delgadas para responder al PopUp
    // MARK: -------------------------------------------------
    
    func popUpDesaparecera(){

        presentadoPopup = false
    }
    
    // MARK: -------------------------------------------------
    // MARK: Otros delgados del view controller inicio_VC
    // MARK: -------------------------------------------------
    
    override func viewDidDisappear(animated: Bool) {
        manejaBeacon = nil
        println("Desapareci")
    }
}