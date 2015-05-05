/*  Este viewController es mostrado cuando se el usuario desea editar su perfil.
*
*
*  editarPerfil_VC.swift
*  ControlEntradas
*
*  Created by desarrolloRM on 06/04/15.
*  Copyright (c) 2015 Desarrollo RM. All rights reserved.
*/

import UIKit

protocol perfilCambiosDelegate{
    func actualizarPerfil(datosPerfil:Perfil)
}

class editarPerfil_VC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------

    var podio:PKTClient!
    var delegado:perfilCambiosDelegate!
    
    private var datosPerfil = Perfil()
    private var infoUsuario:tablaDatosPerfil!
    
    private var selectorImgs = UIImagePickerController()
    private var view_FotoUsuario:usuario_View! //foto de usuario + un filtro
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let superVDim = self.view.frame //dimensiones del superView
        
        selectorImgs.delegate = self

        //****************************************** Posicion de los wigets **************************************//
        
        var btn_atras = UIButton(frame: CGRect(origin: CGPoint(x: 10, y: 30), size:S_BTN_ATRS))
        
        view_FotoUsuario = usuario_View(ubicacion: CGRect(x: 0, y: 0,
                                                          width: superVDim.width,
                                                          height: P_ALT_IMG_USR * superVDim.height))
        
        var view_contenedorBtns = UIView(frame: CGRect(origin:
                                        CGPoint(x: (superVDim.width - S_V_CFB.width) / 2,
                                                y: view_FotoUsuario.container.frame.maxY  - S_V_CFB.height - 8),
                                                      size: S_V_CFB))
        
        var img_fondoXView_cambiarFoto = UIImageView(frame: CGRect(origin: CGPoint.zeroPoint,
                                                  size:view_contenedorBtns.frame.size))
        
        var btn_tomarFoto = UIButton(frame: CGRect( x: 0, y: 0,
                                                    width: view_contenedorBtns.frame.width,
                                                    height: view_contenedorBtns.frame.height/2))
        
        var btn_ElegirFoto = UIButton(frame: CGRectOffset(btn_tomarFoto.frame, 0, btn_tomarFoto.frame.maxY))
        
        
        var btn_guardarCambios = UIButton(frame: CGRect(origin: CGPoint(x: (superVDim.width - S_BTN_GUAR.width) / 2,
            y: superVDim.height - S_BTN_GUAR.height - 10),
            size: S_BTN_GUAR))
        
        let ubicTabla = CGRect( x: (superVDim.width - 300) / 2,
                                y: self.view_FotoUsuario.container.frame.maxY,
                                width: 300,
                                height: btn_guardarCambios.frame.minY
                                        - view_FotoUsuario.container.frame.maxY
                                        - 10)
        
        infoUsuario = tablaDatosPerfil(ubicacion: ubicTabla)

         //*******************************************************************************************************//
        
        //#################################### Personalización de los widgets ####################################//
        
        btn_atras.setImage(UIImage(named:"boton_back_blanco.png"), forState: .Normal)
        btn_atras.setImage(UIImage(named:"boton_back_blanco_on.png"), forState: .Highlighted)
        btn_atras.addTarget(self, action: "irAtras", forControlEvents: .TouchUpInside)
        
        obtenerPerfil()

        self.view.backgroundColor = UIColor.whiteColor()
        
        
        var text_tomarFoto_normal = NSMutableAttributedString(string: "Tomar Foto",
                                                attributes: [ NSFontAttributeName: UIFont.systemFontOfSize(12.0),
                                                              NSForegroundColorAttributeName: gris_texto ])
        
        var text_tomarFoto_hilighted = NSMutableAttributedString(string: "Tomar Foto",
                                                attributes: [ NSFontAttributeName: UIFont.systemFontOfSize(12.0),
                                                            NSForegroundColorAttributeName: UIColor.whiteColor() ])

        btn_tomarFoto.setAttributedTitle(text_tomarFoto_normal, forState: .Normal)
        btn_tomarFoto.setAttributedTitle(text_tomarFoto_hilighted, forState: .Highlighted)
        btn_tomarFoto.addTarget(self, action: "tomarFoto", forControlEvents: .TouchUpInside)
        
        
        let text_ElegirFoto_normal = NSAttributedString(string: "Elegir de la Biblioteca",
                                             attributes: [ NSFontAttributeName: UIFont.systemFontOfSize(12.0),
                                                           NSForegroundColorAttributeName: gris_texto ])
        
        var text_ElegirFoto_hilighted = NSMutableAttributedString(string: "Elegir de la Biblioteca",
                                            attributes: [ NSFontAttributeName: UIFont.systemFontOfSize(12.0),
                                                          NSForegroundColorAttributeName: UIColor.whiteColor() ])
        
        btn_ElegirFoto.setAttributedTitle(text_ElegirFoto_normal, forState: .Normal)
        btn_ElegirFoto.setAttributedTitle(text_ElegirFoto_hilighted, forState: .Highlighted)
        btn_ElegirFoto.addTarget(self, action: "elegirFotoBiblioteca", forControlEvents: .TouchUpInside)
//        btn_ElegirFoto.backgroundColor = UIColor(red: 0.3, green: 0.76, blue: 0.2, alpha: 0.4)
        
//        btn_guardarCambios.setTitle("GUARDAR CAMBIOS", forState: .Normal)
//        btn_guardarCambios.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        btn_guardarCambios.backgroundColor = UIColor.blueColor()
//        btn_guardarCambios.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        
        btn_guardarCambios.setImage(UIImage(named:"boton_guardar_cambios.png"), forState: .Normal)
        btn_guardarCambios.setImage(UIImage(named:"boton_guardar_cambios_on.png"), forState: .Highlighted)
        btn_guardarCambios.addTarget(self, action: "guardarCambios", forControlEvents: .TouchUpInside)
        
        img_fondoXView_cambiarFoto.image = UIImage(named: "elegir_foto.png")
        
//        view_cambiarFoto.backgroundColor = .greenColor()
        
        view_contenedorBtns.addSubview(img_fondoXView_cambiarFoto)
        view_contenedorBtns.addSubview(btn_tomarFoto)
        view_contenedorBtns.addSubview(btn_ElegirFoto)
//        infoUsuario.viewTabla.backgroundColor = UIColor.greenColor()
        
        //########################################################################################################//
        
        super.view.addSubview(view_FotoUsuario.container)
        super.view.addSubview(btn_atras)
        super.view.addSubview(view_contenedorBtns)
        self.view.addSubview(infoUsuario.viewTabla)
        super.view.addSubview(btn_guardarCambios)
    }

    // MARK: ---------------------------
    // MARK: Interacción con los botones
    // MARK: ---------------------------
    
    func IrAInicio(){
        self.dismissViewControllerAnimated(true, completion: nil) //regresa al viewController anterior (inicio)
    }
    
    func irAtras(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func obtenerPerfil(){
        
        //""""""""""""""""""""""""""""""""""""""" Obtener Organizacion """"""""""""""""""""""""""""""""""""""""//
        self.podio.performRequest(PKTOrganizationAPI.requestForAllOrganizations(), completion: {
            (respuestaOrg,errorORG) -> () in
            
            let Org = respuestaOrg.body as NSArray
            var nombreOrg: AnyObject? = Org.valueForKey("name")

            if !(nombreOrg is NSNull){

                self.datosPerfil.organizacion = nombreOrg as NSArray
            }
            
        })
        
        
        //"""""""""""""""""""""""""""""""""""""" Obtener datos de usuario """""""""""""""""""""""""""""""""""""//
        podio.performRequest(PKTUserAPI.requestForUserStatus(), completion: {
            (respuesta,error) -> () in
            
            let perfil:AnyObject? = respuesta.body.objectForKey("profile")
            
            
            
            if !(perfil is NSNull){
                
                //&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Imagen de Usuario &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&//
                let image: AnyObject? = perfil!.objectForKey("image")
                if !(image is NSNull){
                    let link: AnyObject? = image!.objectForKey("link")
                    if !(link is NSNull){
                        
                        let cadenaLink = link as NSString
                        
                        let data = NSData(contentsOfURL: NSURL(string: cadenaLink)!)

                        if (data != nil) {
                            self.view_FotoUsuario.setUsuario(UIImage(data: data!)!)
                        }
                        else{
                            println("Imagen no cargada")
                        }
                    }
                }
                else{
                    self.datosPerfil.imagenUsuario = UIImage(named: "user_desconocido.png")
                }

                //&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Nombre de Usuario &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&//
                let nombre: AnyObject? = perfil!.objectForKey("name")
                if !(nombre is NSNull){
                    self.datosPerfil.nombre = (nombre as NSString)
                }
                
                //&&&&&&&&&&&&&&&&&&&&&&&&&&& Teléfonos del Usuario &&&&&&&&&&&&&&&&&&&&&&&&&&&&&//
                let telefonos: AnyObject? = perfil!.objectForKey("phone")

                if !(telefonos is NSNull) && telefonos != nil{
                    self.datosPerfil.telefono = (telefonos as NSArray)
                }
                
                //&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Emails del Usuario &&&&&&&&&&&&&&&&&&&&&&&&&&&&&//
                let emails: AnyObject? = perfil!.objectForKey("mail")
                if !(emails is NSNull) && emails != nil {

                    self.datosPerfil.email = (emails as NSArray)
                }
                //&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&//
            }
            
            self.infoUsuario.setPerfil(self.datosPerfil)
            
        })
    }

    
    func tomarFoto(){
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) //si hay camara disponible
        {
            selectorImgs.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(selectorImgs, animated: true, completion: nil)
        }
            
        else{
            var alerta = UIAlertController( title: "Atención",
                                            message: "Camara no disponible. Se abrirá la biblioteca de imagenes",//"Camara no encontrada",
                                            preferredStyle: UIAlertControllerStyle.Alert )
            
            alerta.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Cancel, handler: { 
                _ -> () in
                
                //se abre la biblioteca de fotos (despues de que se da tap en el boton aceptar)
                self.selectorImgs.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.presentViewController(self.selectorImgs, animated: true, completion: nil)
            }))
            self.presentViewController(alerta, animated: true, completion: nil)
            
        }
    }
    
    
    func elegirFotoBiblioteca(){
        
            selectorImgs.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(selectorImgs, animated: true, completion: nil)
        
    }
    
    func guardarCambios(){
        
    }
    
    // MARK: ----------------------------------------------
    // MARK: Funciones delegadas para el selector de imagen
    // MARK: ----------------------------------------------
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!)
    {
        selectorImgs.dismissViewControllerAnimated(true, completion: nil)
        datosPerfil.imagenUsuario = info [UIImagePickerControllerOriginalImage] as? UIImage
        view_FotoUsuario.setUsuario(datosPerfil.imagenUsuario)
        
        self.delegado.actualizarPerfil(datosPerfil) //mandamos a actualizar el perfil en inicio_VC
        
    }

    
    // MARK: -------------------------------------------------
    // MARK: Funciones para personalizar el view controller
    // MARK: -------------------------------------------------
    override func preferredStatusBarStyle() -> UIStatusBarStyle{
        
        return .LightContent
    }
}