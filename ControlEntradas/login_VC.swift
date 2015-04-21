//
//
//  Created by desarm on 24/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class login_VC: UIViewController, UITextFieldDelegate {
    
    //MARK: -----------
    //MARK: Propiedades
    //MARK: -----------
    var view_rectLogin:UIView! //Contenedor que agrupa los elemntos de login_VC
    var tFi_nomUsur:UITextField! //Recibe el nombre del usuario
    var tFi_contraseña:UITextField! //Recibe la contraseña
    var btn_Aceptar:UIButton! //boton para disparar el "logeo"
    var btn_cuentaNueva:UIButton!
    var podio:PKTClient!
    private var idCliente = "prueba-bkh64f"
    private var secretCode = "aAa5sgR8D6hlKVBJSORdhMLPdihFJlCPHZseunLcBI42rXnmthNjZwYWbkoF90cJ"
    private var indicadorActividad:UIActivityIndicatorView!
    private var infoPerfil:Perfil = Perfil()
    
    // MARK: ---------------------------------------
    // MARK: Inicializar widgets y personalizar view
    // MARK: ---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        var superVDim = self.view.frame //Superview dimensiones
        let view_altDeseado:CGFloat = 240
        
        //*************************** Posicion de los wigets ************************** //
        view_rectLogin = UIView(frame: CGRect(  x: 25,
                                                y: (superVDim.height-view_altDeseado)/4,
                                                width: superVDim.width - 50,
                                                height: view_altDeseado))
        
        tFi_nomUsur = UITextField(frame: CGRect(x: 8, y: 30, width: view_rectLogin.frame.width - 16, height: 40))
        
        tFi_contraseña = UITextField(frame: CGRect( x: tFi_nomUsur.frame.minX,
                                                    y: tFi_nomUsur.frame.maxY + 20,
                                                    width: tFi_nomUsur.frame.width,
                                                    height: tFi_nomUsur.frame.height))
        
        btn_Aceptar = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn_Aceptar.frame = CGRect( x: tFi_contraseña.frame.width/2 - tFi_contraseña.frame.width/8,
                                    y: tFi_contraseña.frame.maxY + 20,
                                    width: tFi_contraseña.frame.width/4,
                                    height: 35)
        
        btn_cuentaNueva = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn_cuentaNueva.frame = CGRect( x: tFi_contraseña.frame.width/2 - tFi_contraseña.frame.width/4,
                                        y: btn_Aceptar.frame.maxY +  20,
                                        width: tFi_contraseña.frame.width/2,
                                        height: btn_Aceptar.frame.height - 10)
        
        indicadorActividad = UIActivityIndicatorView(frame: CGRect( x: btn_Aceptar.frame.maxX + 10,
                                                                    y: btn_Aceptar.frame.minY,
                                                                    width: btn_Aceptar.frame.height, //mismo que altura
                                                                    height: btn_Aceptar.frame.height))
        
        //****************************************************************************//
        
        //####################### Personalizando los widgets ########################//
        tFi_nomUsur.borderStyle = .RoundedRect
        
//        lbl_cuentaNueva.attributedText = NSAttributedString
        tFi_nomUsur.placeholder = "Usuario"
        tFi_nomUsur.textColor = UIColor.blackColor()
        tFi_nomUsur.addTarget(self, action: "campoEditado", forControlEvents: .EditingChanged)
        
        tFi_contraseña.borderStyle = .RoundedRect
        tFi_contraseña.placeholder = "Contraseña"
        tFi_contraseña.textColor = UIColor.blackColor()
        tFi_contraseña.secureTextEntry =  true
        tFi_contraseña.clearButtonMode = .WhileEditing
        tFi_contraseña.addTarget(self, action: "campoEditado", forControlEvents: .EditingChanged)
        
        btn_Aceptar.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn_Aceptar.setTitleColor(UIColor.blackColor(), forState: .Disabled)
        btn_Aceptar.setTitle("Aceptar", forState: .Normal)
        btn_Aceptar.addTarget(self, action: "ejecutarLogin", forControlEvents: .TouchUpInside)
        campoEditado()
//        btn_Aceptar.showsTouchWhenHighlighted = true
        
        btn_cuentaNueva.backgroundColor = UIColor.clearColor()
        btn_cuentaNueva.setTitle("¿Nuevo? Registrate aquí", forState: .Normal)
        btn_cuentaNueva.setTitleColor(UIColor.grayColor(), forState: .Normal)
        btn_cuentaNueva.titleLabel?.font =  btn_cuentaNueva.titleLabel?.font.fontWithSize(11.0)
        
//        indicadorActividad.activityIndicatorViewStyle = .Gray
        indicadorActividad.color = UIColor.blackColor()
        indicadorActividad.stopAnimating()
//        indicadorActividad.hidesWhenStopped = false
        
        view_rectLogin.userInteractionEnabled = true
        
        view_rectLogin.addSubview(tFi_nomUsur)
        view_rectLogin.addSubview(tFi_contraseña)
        view_rectLogin.addSubview(btn_Aceptar)
        view_rectLogin.addSubview(btn_cuentaNueva)
        view_rectLogin.addSubview(indicadorActividad)
        
        view_rectLogin.backgroundColor = UIColor.whiteColor()
        
        //##########################################################################//
        
        var tap = UITapGestureRecognizer(target: self, action: "desaparecerTeclado")
        
        PodioKit.setupWithAPIKey(idCliente, secret: secretCode)
        podio =  PKTClient.sharedClient()
        
        self.view.backgroundColor = UIColor.grayColor()
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
    
    func ejecutarLogin() { //validar datos y pasar a la siguiente escena
//        var viewCtrl_Siguiente = home_VC() //view controller siguiente
//        //        var viewCtrl_Siguiente = perfiles_VC()
//        
//        //        viewCtrl_Siguiente.modalPresentationStyle = .OverFullScreen
//        viewCtrl_Siguiente.modalTransitionStyle = .FlipHorizontal
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
                    
                    alerta = UIAlertController(title: "Error", message: "Usuario o contraseña incorrecta. Intenta de nuevo", preferredStyle: UIAlertControllerStyle.Alert)
                    alerta.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Cancel, handler: nil))
                    self.presentViewController(alerta, animated: true, completion: nil)
                    self.indicadorActividad.stopAnimating()
                    
                }
                else{
                    alerta = UIAlertController(title: "Error", message: respuesta.body.objectForKey("error_description") as? String, preferredStyle: UIAlertControllerStyle.Alert)
                    alerta.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Cancel, handler: nil))
                    self.presentViewController(alerta, animated: true, completion: nil)
                    self.indicadorActividad.stopAnimating()
                }
        })
        
    }
    
    func pasarSiguienteEscena(){
        
        podio.performRequest(PKTUserAPI.requestForUserStatus(), completion: {
            (respuesta,error) -> () in
            
            let perfil:AnyObject? = respuesta.body.objectForKey("profile")
            
            if !(perfil is NSNull){
                let image: AnyObject? = perfil!.objectForKey("image")
                if !(image is NSNull){
                    let link: AnyObject? = image!.objectForKey("link")
                    if !(link is NSNull){
                        
                        var cadena = link as NSString
                        
                        var data = NSData(contentsOfURL: NSURL(string: cadena)!)
                        self.infoPerfil.imagenUsuario = UIImage(data: data!) //Se obtiene la iamgen del usuario
                    }
                }
                else{
                    self.infoPerfil.imagenUsuario = UIImage(named: "user_desconocido.png")
                }
                
                let nombre: AnyObject? = perfil!.objectForKey("name")
                if !(nombre is NSNull){
                    self.infoPerfil.nombre = nombre as NSString //Se obtiene el nombre del usuario
                    
                    println(nombre as NSString)
                    
                }
                else{
                    self.infoPerfil.nombre = ""
                }
                
//                let telefono: AnyObject? = perfil!.objectForKey("phone")
//
//                if !(telefono is NSNull) && telefono != nil{
//                    self.infoPerfil.telefono = telefono as NSArray
//                }
//                
//                let email: AnyObject? = perfil!.objectForKey("mail")
//                if !(email is NSNull) && email != nil {
//                    self.infoPerfil.email = email! as NSArray
//                }
                
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
                    
                    var viewCtrl_Siguiente = home_VC() //view controller siguiente
                    //        var viewCtrl_Siguiente = perfiles_VC()
                    
                    //        viewCtrl_Siguiente.modalPresentationStyle = .OverFullScreen
                    viewCtrl_Siguiente.modalTransitionStyle = .FlipHorizontal
                    viewCtrl_Siguiente.previousVC = self
                    
                    //Inicializar las propiedades de home_vc
                    viewCtrl_Siguiente.infoPerfil = self.infoPerfil
                    viewCtrl_Siguiente.podio = self.podio
                    ///////////////////////////////////////
                    
                    self.indicadorActividad.stopAnimating()
                    self.presentViewController(viewCtrl_Siguiente, animated: true, completion: nil)
                })

            }
        })
    }
    
    // MARK: ---------------------------
    // MARK: Delgados para los textField
    // MARK: ---------------------------

    func campoEditado() {
        
        if tFi_contraseña.text.isEmpty || tFi_nomUsur.text.isEmpty{
            btn_Aceptar.enabled = false
            
            UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.btn_Aceptar.backgroundColor = UIColor.lightGrayColor()
                }, completion: nil)
        }
        else{
            btn_Aceptar.enabled = true
            
            UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.btn_Aceptar.backgroundColor = UIColor.blueColor()
                }, completion: nil)
        }
    }
}

