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
    
    private var lbl_indicacion:UILabel!
    private var btn_Registrar:UIButton!
    private var tbl_formulario:tablaDatosPerfil!
    
    // MARK: ---------------------------------------
    // MARK: Inicializar widgets y personalizar view
    // MARK: ---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        let espacioHoriz:CGFloat = 60
        let espacioCentro:CGFloat = 110
        let textField_Alto:CGFloat = 40
        let superVDim = self.view.frame //Superview dimensiones
        
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
        
        tbl_formulario = tablaDatosPerfil(ubicacion: CGRect(
                                                x: espacioHoriz,
                                                y: lbl_indicacion.frame.maxY + 30,
                                                width: superVDim.width - espacioHoriz * 2 ,
                                                height: btn_Registrar.frame.minY - lbl_indicacion.frame.maxY  - 30 - 20))
        
        //*******************************************************************************************************//
        
        //####################### Personalizando los widgets ########################//
        btn_atras.setImage(UIImage(named:"boton_back_verde.png"), forState: .Normal)
        btn_atras.setImage(UIImage(named:"boton_back_verde_on.png"), forState: .Highlighted)
        btn_atras.addTarget(self, action: "irAtras", forControlEvents: .TouchUpInside)
        
        img_Empresa.image = UIImage(named: "Logo_republica.png")
        
        lbl_indicacion.text = "Ayudanos con tu registro"
        lbl_indicacion.textColor = gris_texto
        lbl_indicacion.font = lbl_indicacion.font.fontWithSize(11.0)
        lbl_indicacion.textAlignment = .Center
        
        btn_Registrar.setImage(UIImage(named:"boton_registrar.png"), forState: .Normal)
        btn_Registrar.setImage(UIImage(named:"boton_registrar_on.png"), forState: .Highlighted)
        btn_Registrar.setTitle("Registrar", forState: .Normal)

        btn_Registrar.backgroundColor = UIColor.lightGrayColor()
        
        //##########################################################################//

        super.view.backgroundColor = .whiteColor()
        self.view.addSubview(btn_atras)
        super.view.addSubview(img_Empresa)
        super.view.addSubview(lbl_indicacion)
        super.view.addSubview(tbl_formulario.viewTabla)
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