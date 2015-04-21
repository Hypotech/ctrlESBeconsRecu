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
    var podio:PKTClient!
    
    private var celd_nombre:UITableViewCell!
    private var celd_telfno:UITableViewCell!
    private var celd_email:UITableViewCell!
    private var celd_orgcion:UITableViewCell!
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    override func viewDidLoad(){
        super.viewDidLoad()
        
        celd_nombre = UITableViewCell(style: .Value2, reuseIdentifier: "ajustesCelda")
        celd_orgcion = UITableViewCell(style: .Value2, reuseIdentifier: "ajustesCelda")
        celd_telfno = UITableViewCell(style: .Value2, reuseIdentifier: "ajustesCelda")
        celd_email = UITableViewCell(style: .Value2, reuseIdentifier: "ajustesCelda")
        obtenerPerfil()
        
        celd_nombre.textLabel?.text = "Nombre"
        celd_orgcion.textLabel?.text = "Organización"
        celd_telfno.textLabel?.text = "Teléfono"
        celd_email.textLabel?.text = "Email"
        
        var tmpArray:[UITableViewCell] = [celd_nombre,celd_orgcion, celd_telfno,celd_email]
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
//        podio =  PKTClient.sharedClient()
        
        infoUsuario = tablaConfig(superVDim: ubicTabla,datos: tmpArray)
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(infoUsuario.viewTabla)
    }
    
    func tapButton(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func obtenerPerfil(){
        
        //************ Obtener Organizacion ************//
        self.podio.performRequest(PKTOrganizationAPI.requestForAllOrganizations(), completion: {
            (respuestaOrg,errorORG) -> () in
            
            let Org = respuestaOrg.body as NSArray
            var nombreOrg: AnyObject? = Org.valueForKey("name")
            
            if !(nombreOrg is NSNull){
                
                var conteo = 0
                var cadenaOrg:String = ""
                for i in (nombreOrg! as NSArray) {
                    
                    cadenaOrg =  cadenaOrg + (i as String)
                    if conteo != (nombreOrg as NSArray).count - 1 {
                        cadenaOrg = cadenaOrg + ","
                    }
                    
                    conteo++
                }
                self.celd_orgcion.detailTextLabel?.text = cadenaOrg
            }
            
        })
        //************************************************//
        
        //************ Obtener datos usuario ************//
        podio.performRequest(PKTUserAPI.requestForUserStatus(), completion: {
            (respuesta,error) -> () in
            
            let perfil:AnyObject? = respuesta.body.objectForKey("profile")
            
            if !(perfil is NSNull){
                
                let nombre: AnyObject? = perfil!.objectForKey("name")
                if !(nombre is NSNull){
                    self.celd_nombre.detailTextLabel?.text = nombre as NSString
                }
                
                let telefonos: AnyObject? = perfil!.objectForKey("phone")

                if !(telefonos is NSNull) && telefonos != nil{
                    
                    var conteo = 0
                    var cadenaTel:String = ""
                    for i in (telefonos as NSArray) {

                        cadenaTel =  cadenaTel + (i as String)
                        if conteo != (telefonos as NSArray).count - 1 {
                            cadenaTel = cadenaTel + ","
                        }

                        conteo++
                    }
                    self.celd_telfno.detailTextLabel?.text = cadenaTel
                }
                
                let email: AnyObject? = perfil!.objectForKey("mail")
                if !(email is NSNull) && email != nil {

                    var conteo = 0
                    var cadenaEmail:String = ""
                    for i in (email! as NSArray) {
                        
                        cadenaEmail =  cadenaEmail + (i as String)
                        if conteo != (email as NSArray).count - 1 {
                            cadenaEmail = cadenaEmail + ","
                        }
                        
                        conteo++
                    }
                    self.celd_email.detailTextLabel?.text = cadenaEmail
                }
                
            }
        })
        //****************************************//
    }
}