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
    
//    private var tFi_Nombre:UITextField!
//    private var tFi_Apellidos:UITextField!
//    private var tFi_Nacimento:UITextField!
//    private var img_usuario:UIImageView!
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
        
        var btn_guardar = UIButton(frame: CGRect(origin: CGPoint(x: (superVDim.width - S_BTN_GUAR.width) / 2,
                                                                 y: superVDim.height - S_BTN_GUAR.height - 5),
                                                 size: S_BTN_GUAR))
        
         //*******************************************************************************************************//
        
        //#################################### Personalización de los widgets ####################################//
        
        obtenerPerfil()
        
        self.navigationController?.navigationBar.barStyle  = UIBarStyle.Black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "〈 Inicio", style: .Plain, target: self, action: "IrAInicio")
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.greenColor()
        navigationItem.title = "✏️Edicción de perfil"
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        btn_tomarFoto.setTitle("Tomar Foto", forState: .Normal)
//        btn_tomarFoto.backgroundColor = UIColor(red: 0.56, green: 0.76, blue: 0.21, alpha: 0.3)
        
        btn_ElegirFoto.setTitle("Elegir de la Biblioteca", forState: .Normal)
//        btn_ElegirFoto.backgroundColor = UIColor(red: 0.3, green: 0.76, blue: 0.2, alpha: 0.4)
        
        img_fondoXView_cambiarFoto.image = UIImage(named: "elegir_foto.png")
        
//        view_cambiarFoto.backgroundColor = .greenColor()
        
        view_contenedorBtns.addSubview(img_fondoXView_cambiarFoto)
        view_contenedorBtns.addSubview(btn_tomarFoto)
        view_contenedorBtns.addSubview(btn_ElegirFoto)
        //########################################################################################################//
        
        super.view.addSubview(view_FotoUsuario.container)
        super.view.addSubview(view_contenedorBtns)
        super.view.addSubview(btn_guardar)
    }

    // MARK: ---------------------------
    // MARK: Interacción con los botones
    // MARK: ---------------------------
    
    func IrAInicio(){
        self.dismissViewControllerAnimated(true, completion: nil) //regresa al viewController anterior (inicio)
    }
    
    func obtenerPerfil(){
        
        //*************************************** Obtener Organizacion ************************************//
        self.podio.performRequest(PKTOrganizationAPI.requestForAllOrganizations(), completion: {
            (respuestaOrg,errorORG) -> () in
            
            let Org = respuestaOrg.body as NSArray
            var nombreOrg: AnyObject? = Org.valueForKey("name")

            if !(nombreOrg is NSNull){

                self.datosPerfil.organizacion = nombreOrg as NSArray
            }
            
        })
        
        //************************************* Obtener datos de usuario *************************************//
        podio.performRequest(PKTUserAPI.requestForUserStatus(), completion: {
            (respuesta,error) -> () in
            
            let perfil:AnyObject? = respuesta.body.objectForKey("profile")
            
            
            
            if !(perfil is NSNull){
                
                //&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Imagen de Usuario &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&//
                let image: AnyObject? = perfil!.objectForKey("image")
                if !(image is NSNull){
                    let link: AnyObject? = image!.objectForKey("link")
                    if !(link is NSNull){
                        
                        var cadena = link as NSString
                        
                        var data = NSData(contentsOfURL: NSURL(string: cadena)!)
                        self.view_FotoUsuario.setUsuario(UIImage(data: data!)!)
//                        self.datosPerfil.imagenUsuario = UIImage(data: data!)
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
            
            var superVDim = self.view.frame
            var ubicTabla = CGRect( x: (superVDim.width - 300) / 2,
                                    y: self.view_FotoUsuario.container.frame.maxY,
                                    width: 300,
                                    height: 590)
            
            self.infoUsuario = tablaDatosPerfil(ubicacion: ubicTabla,datos: self.datosPerfil)
            self.view.addSubview(self.infoUsuario.viewTabla)
            
        })
        //*****************************************************************************************************//
    }

    // MARK: ------------------------------------------
    // MARK: Funciones delegadas para cambiar la imagen
    // MARK: ------------------------------------------
    
    func seleccionarImagen(){
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            selectorImgs.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(selectorImgs, animated: true, completion: nil)
        }
        else{
            selectorImgs.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(selectorImgs, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!)
    {
        selectorImgs.dismissViewControllerAnimated(true, completion: nil)
        datosPerfil.imagenUsuario = info [UIImagePickerControllerOriginalImage] as? UIImage
//        tbl_infoPerfil.setImageUsr(datosPerfil.imagenUsuario) //actualizamos la tabla
        
        self.delegado.actualizarPerfil(datosPerfil) //mandamos a actualizar el perfil en inicio_VC
        
    }
    
}