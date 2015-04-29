//
//  registroEmail_VC.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 27/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class registroEmail_VC: UIViewController {
    //MARK: -----------
    //MARK: Propiedades
    //MARK: -----------
    
    private var view_rectRegistro:UIView!
    
    private var lbl_indicacion:UILabel!
    private var tFi_Nombre:UITextField!
    private var tFi_Apellidos:UITextField!
    private var tFi_Edad:UITextField!
    private var tFi_Email:UITextField!
    private var tFi_Contraseña:UITextField!
    private var btn_Registrar:UIButton!
    
    // MARK: ---------------------------------------
    // MARK: Inicializar widgets y personalizar view
    // MARK: ---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        let espacioHoriz:CGFloat = 60
        let espacioCentro:CGFloat = 110
        let textField_Alto:CGFloat = 40
        var superVDim = self.view.frame //Superview dimensiones
        
        //************************************* Posicion de los wigets ******************************************//
        var btn_atras = UIButton(frame: CGRect(origin: CGPoint(x: 10, y: 30), size:S_BTN_ATRS))
        
        var img_Empresa = UIImageView(frame: CGRect(x: A_IMG_EMP.x,
                                                    y: superVDim.width / 2 - espacioCentro,
                                                    width: superVDim.width - A_IMG_EMP.x * 2,
                                                    height: A_IMG_EMP.height))
        
        lbl_indicacion = UILabel(frame: CGRect( x: img_Empresa.frame.minX, y: img_Empresa.frame.maxY + 64,
                                                width: img_Empresa.frame.width, height: 14))
        
        btn_Registrar = UIButton(frame: CGRect( origin: CGPoint (x: (superVDim.width - S_BTN_REG.width) / 2,
                                                                 y: (superVDim.height - S_BTN_REG.height) - 10),
                                                size: S_BTN_REG))
        
        view_rectRegistro = UIView(frame: CGRect(x: espacioHoriz,
                                                 y: lbl_indicacion.frame.maxY + 30,
                                                 width: superVDim.width - espacioHoriz * 2 ,
                                                 height: btn_Registrar.frame.minY - lbl_indicacion.frame.maxY - 20))
        
        tFi_Nombre = UITextField(frame: CGRect(x: 0, y: 0, width: view_rectRegistro.frame.width, height: textField_Alto))
        tFi_Apellidos = UITextField(frame: CGRectOffset(tFi_Nombre.frame, 0,
                                                        textField_Alto + 10))
        tFi_Edad = UITextField(frame: CGRectOffset(tFi_Apellidos.frame, 0, textField_Alto + 10))
        tFi_Email = UITextField(frame: CGRectOffset(tFi_Edad.frame, 0, textField_Alto + 10))
        tFi_Contraseña = UITextField(frame: CGRectOffset(tFi_Email.frame, 0, textField_Alto + 10))
        //*******************************************************************************************************//
        
        //####################### Personalizando los widgets ########################//
        btn_atras.backgroundColor = UIColor.greenColor()
        btn_atras.addTarget(self, action: "irAtras", forControlEvents: .TouchUpInside)
        
        img_Empresa.image = UIImage(named: "Logo_republica.png")
        
        lbl_indicacion.text = "Ayudanos con tu registro"
        lbl_indicacion.textColor = gris_texto
        lbl_indicacion.font = lbl_indicacion.font.fontWithSize(11.0)
        lbl_indicacion.textAlignment = .Center
        
        tFi_Nombre.placeholder = "Nombre"
        
        tFi_Apellidos.placeholder = "Apellidos"
        tFi_Edad.placeholder = "Edad"
        
        tFi_Email.placeholder = "Email"
        tFi_Email.keyboardType = .EmailAddress
        
        tFi_Contraseña.placeholder = "Contraseña"
        tFi_Contraseña.secureTextEntry =  true
        
        btn_Registrar.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn_Registrar.setTitleColor(UIColor.whiteColor(), forState: .Disabled)
        btn_Registrar.setTitle("Registrar", forState: .Normal)
//        btn_Registrar.addTarget(self, action: "registarUsuario", forControlEvents: .TouchUpInside)
//        btn_Registrar.enabled = false
        btn_Registrar.backgroundColor = UIColor.lightGrayColor()
        
        view_rectRegistro.backgroundColor = .whiteColor()
        
        view_rectRegistro.addSubview(tFi_Nombre)
        view_rectRegistro.addSubview(tFi_Apellidos)
        view_rectRegistro.addSubview(tFi_Edad)
        view_rectRegistro.addSubview(tFi_Email)
        view_rectRegistro.addSubview(tFi_Contraseña)
        
        //##########################################################################//

        super.view.backgroundColor = .whiteColor()
        self.view.addSubview(btn_atras)
        super.view.addSubview(img_Empresa)
        super.view.addSubview(lbl_indicacion)
        super.view.addSubview(view_rectRegistro)
        super.view.addSubview(btn_Registrar)
        
        //*******************************************************************************************************//
    }
    
    // MARK: ----------------------------------------
    // MARK: Acciones para la interacción con Buttons
    // MARK: ----------------------------------------
    func irAtras(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}