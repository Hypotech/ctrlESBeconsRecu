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
    var infoUsuario:tablaDatosPerfil!
    var podio:PKTClient!
    
    private var celd_nombre:UITableViewCell!
    private var celd_telfno:UITableViewCell!
    private var celd_email:UITableViewCell!
    private var celd_orgcion:UITableViewCell!
    private var datosPerfil = Perfil()
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    override func viewDidLoad(){
        super.viewDidLoad()

        obtenerPerfil()
        
        self.navigationController?.navigationBar.barStyle  = UIBarStyle.Black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "〈 Inicio", style: .Plain, target: self, action: "IrAInicio")
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.greenColor()
        navigationItem.title = "✏️Edicción de perfil"
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
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
        
        //************************************* Obtener datos usuario *************************************//
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
                        self.datosPerfil.imagenUsuario = UIImage(data: data!)
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
            var ubicTabla = superVDim
            ubicTabla.origin.y = self.navigationController!.navigationBar.frame.maxY + 20
            
            self.infoUsuario = tablaDatosPerfil(superVDim: ubicTabla,datos: self.datosPerfil)
            self.view.addSubview(self.infoUsuario.viewTabla)
        })
        //*****************************************************************************************************//
    }
}