//
//
//  Created by desarm on 24/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class login_VC: UIViewController {
    //MARK: -----------
    //MARK: Propiedades
    //MARK: -----------
    var view_rectLogin:UIView! //Contenedor que agrupa los elemntos de login_VC
    var tFi_nomUsur:UITextField! //Recibe el nombre del usuario
    var tFi_contraseña:UITextField! //Recibe la contraseña
    var btn_Aceptar:UIButton! //boton para disparar el "logeo"
    var btn_cuentaNueva:UIButton!
    
    // MARK: ---------------------------------------
    // MARK: Inicializar widgets y personalizar view
    // MARK: ---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        var superVDim = self.view.frame //Superview dimensiones
        let view_altDeseado:CGFloat = 240
        
        //********* Posicion de los wigets ********* //
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
        //*****************************************//
        
        //######### Personalizando los widgets #########//
        tFi_nomUsur.borderStyle = .RoundedRect
        
//        lbl_cuentaNueva.attributedText = NSAttributedString
        tFi_nomUsur.placeholder = "Usuario"
        tFi_nomUsur.textColor = UIColor.blackColor()
        
        tFi_contraseña.borderStyle = .RoundedRect
        tFi_contraseña.placeholder = "Contraseña"
        tFi_contraseña.textColor = UIColor.blackColor()
        tFi_contraseña.secureTextEntry =  true
        
        btn_Aceptar.backgroundColor = UIColor.blueColor();
        btn_Aceptar.setTitle("Aceptar", forState: .Normal)
        btn_Aceptar.addTarget(self, action: "ejecutarLogin", forControlEvents: UIControlEvents.TouchUpInside)
//        btn_Aceptar.showsTouchWhenHighlighted = true
        
        btn_cuentaNueva.backgroundColor = UIColor.clearColor()
        btn_cuentaNueva.setTitle("¿Nuevo? Registrate aquí", forState: .Normal)
        btn_cuentaNueva.setTitleColor(UIColor.grayColor(), forState: .Normal)
        btn_cuentaNueva.titleLabel?.font =  btn_cuentaNueva.titleLabel?.font.fontWithSize(11.0)
        
        view_rectLogin.userInteractionEnabled = true
        
        view_rectLogin.addSubview(tFi_nomUsur)
        view_rectLogin.addSubview(tFi_contraseña)
        view_rectLogin.addSubview(btn_Aceptar)
        view_rectLogin.addSubview(btn_cuentaNueva)
        view_rectLogin.backgroundColor = UIColor.whiteColor()
        //#############################################//
        
        var tap = UITapGestureRecognizer(target: self, action: "desaparecerTeclado")
        
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
        println("Login exitoso")
        var viewCtrl_Siguiente = home_VC()
//        var viewCtrl_Siguiente = perfiles_VC()
        
//        viewCtrl_Siguiente.modalPresentationStyle = .OverFullScreen
        viewCtrl_Siguiente.modalTransitionStyle = .FlipHorizontal
        
        self.presentViewController(viewCtrl_Siguiente, animated: true, completion: nil)
    }
}

