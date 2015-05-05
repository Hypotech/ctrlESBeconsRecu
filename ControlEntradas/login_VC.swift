//
//
//  Created by desarm on 24/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class login_VC: UIViewController,UITextFieldDelegate {
    
    //MARK: -----------
    //MARK: Propiedades
    //MARK: -----------
    var view_rectLogin:UIView! //Contenedor que agrupa los elemntos de login_VC
    var tFi_nomUsur:UITextField! //Recibe el nombre del usuario
    var tFi_contraseña:UITextField! //Recibe la contraseña
    var btn_Ingresar:UIButton! //boton para disparar el "logeo"
    var podio:PKTClient!
    
    private var idCliente = "rpbkasistencia"
    private var secretCode = "YQgHf9awjWA8cVS2vY9Jn1JcSBydGPqDhAjuU4mIqQ6Mh90hkuKJvTMJ4rCKK4Cu"
    private var indicadorActividad:UIActivityIndicatorView!
    private var infoPerfil:Perfil = Perfil()
    private var tecladoHabilitado = false
    
    // MARK: ---------------------------------------
    // MARK: Inicializar widgets y personalizar view
    // MARK: ---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        let superVDim = self.view.frame //Superview dimensiones
        let view_altDeseado:CGFloat = 220
        
        //************************************* Posicion de los wigets ******************************************//

        var btn_atras = UIButton(frame: CGRect(origin: CGPoint(x: 10, y: 30), size:S_BTN_ATRS))
        
        var img_Empresa = UIImageView(frame: CGRect(x: 55,
                                                    y: superVDim.width / 2 - 50,
                                                    width: superVDim.width - 110,
                                                    height: 100))
        
        view_rectLogin = UIView(frame: CGRect(  x: 25,
                                                y: (superVDim.height-view_altDeseado),
                                                width: superVDim.width - 50,
                                                height: view_altDeseado))
        
        tFi_nomUsur = UITextField(frame: CGRect(x: 8, y: 30, width: view_rectLogin.frame.width - 16, height: 40))
        
        tFi_contraseña = UITextField(frame: CGRect( x: tFi_nomUsur.frame.minX,
                                                    y: tFi_nomUsur.frame.maxY + 20,
                                                    width: tFi_nomUsur.frame.width,
                                                    height: tFi_nomUsur.frame.height))
        
        btn_Ingresar = UIButton(frame: CGRect(origin: CGPoint(
                                                                x: (view_rectLogin.frame.width - S_BTN_INGR.width) / 2 ,
                                                                y: tFi_contraseña.frame.maxY + 20),
                                              size: S_BTN_INGR))
        
        indicadorActividad = UIActivityIndicatorView(frame: CGRect( x: btn_Ingresar.frame.maxX - 40,
                                                                    y: btn_Ingresar.frame.minY,
                                                                    width: 40,
                                                                    height: 40))
        
        //*******************************************************************************************************//
        
        //####################### Personalizando los widgets ########################//
        
        btn_atras.setImage(UIImage(named:"boton_back_verde.png"), forState: .Normal)
        btn_atras.setImage(UIImage(named:"boton_back_verde_on.png"), forState: .Highlighted)
        btn_atras.addTarget(self, action: "irAtras", forControlEvents: .TouchUpInside)
        
        img_Empresa.image = UIImage(named: "Logo_republica.png")
        
        tFi_nomUsur.borderStyle = .RoundedRect
        
        tFi_nomUsur.placeholder = "Email"
        tFi_nomUsur.textColor = UIColor.blackColor()
//        tFi_nomUsur.addTarget(self, action: "comenzoEdiccionCampo", forControlEvents: .EditingChanged)
        tFi_nomUsur.keyboardType = .EmailAddress
        tFi_nomUsur.autocapitalizationType = .None
        tFi_nomUsur.autocorrectionType = .No
        
        tFi_contraseña.borderStyle = .RoundedRect
        tFi_contraseña.placeholder = "Contraseña"
        tFi_contraseña.textColor = UIColor.blackColor()
        tFi_contraseña.secureTextEntry =  true
        tFi_contraseña.clearButtonMode = .WhileEditing
//        tFi_contraseña.addTarget(self, action: "comenzoEdiccionCampo", forControlEvents: .EditingChanged)
        
        btn_Ingresar.setImage(UIImage(named:"boton_ingresar.png"), forState: .Normal)
        btn_Ingresar.setImage(UIImage(named:"boton_ingresar_on.png"), forState: .Highlighted)
        btn_Ingresar.addTarget(self, action: "ejecutarLogin", forControlEvents: .TouchUpInside)
//        btn_Ingresar.enabled = false
        
        indicadorActividad.color = UIColor.blackColor()
        indicadorActividad.stopAnimating()

        
        view_rectLogin.userInteractionEnabled = true
        
        view_rectLogin.addSubview(tFi_nomUsur)
        view_rectLogin.addSubview(tFi_contraseña)
        view_rectLogin.addSubview(btn_Ingresar)
        view_rectLogin.addSubview(indicadorActividad)
        
        view_rectLogin.backgroundColor = UIColor.whiteColor()
        
        //##########################################################################//
        
        var tap = UITapGestureRecognizer(target: self, action: "desaparecerTeclado")
        
        PodioKit.setupWithAPIKey(idCliente, secret: secretCode)
        podio =  PKTClient.sharedClient()
        
        tFi_contraseña.delegate = self
        tFi_nomUsur.delegate = self
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(btn_atras)
        self.view.addSubview(img_Empresa)
        self.view.addSubview(view_rectLogin)
        self.view.addGestureRecognizer(tap)
    }
    
    func desaparecerTeclado(){
        tFi_nomUsur.resignFirstResponder()
        tFi_contraseña.resignFirstResponder()
    }

    // MARK: ----------------------------------------
    // MARK: Acciones para la interacción con Buttons
    // MARK: ----------------------------------------
    
    func irAtras(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func ejecutarLogin() { //validar datos y pasar a la siguiente escena
//        var viewCtrl_Siguiente = inicio_VC() //view controller siguiente
//        //        var viewCtrl_Siguiente = perfiles_VC()
//        
//        //        viewCtrl_Siguiente.modalPresentationStyle = .OverFullScreen
//        viewCtrl_Siguiente.modalTransitionStyle = .FlipHorizontal
//        viewCtrl_Siguiente.infoPerfil = self.infoPerfil
//        viewCtrl_Siguiente.VC_anterior = self
//        self.presentViewController(viewCtrl_Siguiente, animated: true, completion: nil)
        
        var alerta:UIAlertController!
        indicadorActividad.startAnimating()
        
        podio.authenticateAsUserWithEmail(tFi_nomUsur.text, password: tFi_contraseña.text, completion: {
                (respuesta, error) -> () in
                
                if respuesta.statusCode == OK_login{
                    println("Login exitoso")
                    
                    self.pasarSiguienteEscena()
                    
                }
                else if(respuesta.statusCode == ContraseñaUsuario_Invalido){
                    
                    alerta = UIAlertController( title: "Error",
                                                message: "Usuario o contraseña incorrecta. Intenta de nuevo",
                                                preferredStyle: UIAlertControllerStyle.Alert)
                    
                    alerta.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Cancel, handler: nil))
                    self.presentViewController(alerta, animated: true, completion: nil)
                    
                    self.indicadorActividad.stopAnimating()
                    
                }
                else{
                    alerta = UIAlertController( title: "Error", message:
                                                respuesta.body.objectForKey("error_description") as? String,
                                                preferredStyle: UIAlertControllerStyle.Alert )
                    
                    alerta.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Cancel, handler: nil))
                    self.presentViewController(alerta, animated: true, completion: nil)
                    
                    self.indicadorActividad.stopAnimating()
                }
        })
        
    }
    
    func pasarSiguienteEscena(){
        
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
                        
                        if (data != nil) {
                            self.infoPerfil.imagenUsuario = UIImage(data: data!) //Se obtiene la imagen del usuario
                        }
                        else{
                            println("Imagen no cargada")
                        }
                    }
                }
                else{
                    self.infoPerfil.imagenUsuario = UIImage(named: "user_desconocido.png")
                }
                
                //&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Nombre de Usuario &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&//
                let nombre: AnyObject? = perfil!.objectForKey("name")
                if !(nombre is NSNull){
                    self.infoPerfil.nombre = nombre as NSString //Se obtiene el nombre del usuario
                    
                    println(nombre as NSString)
                    
                }
                else{
                    self.infoPerfil.nombre = ""
                }
                //********************************* Obtener Organizacion *******************************//
                self.podio.performRequest(PKTOrganizationAPI.requestForAllOrganizations(), completion: {
                    (respuestaOrg,errorORG) -> () in
                    
                    let Org = respuestaOrg.body as NSArray
                    var nombreOrg: AnyObject? = Org.valueForKey("name")
                    
                    if !(nombreOrg is NSNull){
                        self.infoPerfil.organizacion = nombreOrg! as NSArray  //Se obtiene los nombres de las organizaciones
                    }
                    else{
                        self.infoPerfil.organizacion = []
                    }
                    
                    var viewCtrl_Siguiente = inicio_VC() //view controller siguiente
                    //        var viewCtrl_Siguiente = perfiles_VC()
                    
                    //        viewCtrl_Siguiente.modalPresentationStyle = .OverFullScreen
                    viewCtrl_Siguiente.modalTransitionStyle = .FlipHorizontal
                    
                    //Inicializar las propiedades de home_vc
                    viewCtrl_Siguiente.infoPerfil = self.infoPerfil
                    viewCtrl_Siguiente.podio = self.podio
                    viewCtrl_Siguiente.VC_anterior = self
                    ///////////////////////////////////////
                    
                    self.indicadorActividad.stopAnimating()
                    self.presentViewController(viewCtrl_Siguiente, animated: true, completion: nil)
                })

            }
        })
    }
    
    // MARK: ----------------------------
    // MARK: Interacción con el textField
    // MARK: ----------------------------

    func comenzoEdiccionCampo() {
        
        if tFi_nomUsur.text.isEmpty{ //deshabilitar boton y borrar la contraseña
            btn_Ingresar.enabled = false
            
            UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.tFi_contraseña.text = ""
                }, completion: nil)
        }
        else if tFi_contraseña.text.isEmpty {//deshabilitar boton
            btn_Ingresar.enabled = false
            
            UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                }, completion: nil)
            
        }
        else{ //habilitar boton
            btn_Ingresar.enabled = true
            UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                }, completion: nil)
        }
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        
       view_rectLogin.frame.origin.y -= 190
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        view_rectLogin.frame.origin.y += 190
    }
}

