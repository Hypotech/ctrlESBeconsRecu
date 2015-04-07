//
//  registro_E_S_Notificaciones.swift
//  foo
//
//  Created by desarm on 26/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

enum NotificacionTipo: Int{
    case NotificacionErrorRegistro
    case NotificacionExitoRegistro
}

protocol registro_E_S_NotificacionesDelegate{
    func willShowNotifacation()
}

class registro_E_S_Notificaciones: UIView {
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    var titulo:UILabel!
    var accesoryImage:UIImage!
    private var boton:UIButton!
    var estiloActual:NotificacionTipo!
    var  delegate:registro_E_S_NotificacionesDelegate!
    var dismissalDelay: NSTimeInterval!
    var dismissalTimer:NSTimer!
    var presentFromTop = false
    
    func listoParaMostrar () -> Bool{

        if self.superview != nil{
            return true
        }
         return false
    }
    
    // MARK: -------------
    // MARK: Constructores
    // MARK: -------------
    init(titulo:String, estilo:NotificacionTipo) {
        self.titulo.text = titulo
        
        boton.setTitle("Registrar", forState: UIControlState.Normal)
        estiloActual = estilo
        
        super.init()
    }
    
    init(imagen:UIImage, estilo:NotificacionTipo) {
        self.accesoryImage = imagen

        estiloActual = estilo

        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: -------------
    // MARK: Presentacion
    // MARK: -------------
    
    func mostrar(){
//        if (self.listoParaMostrar()){
//            if (self.delegate && respondsToSelector(self.delegate.willShowNotifacation())){
//                self.delegate.willShowNotifacation()
//            }
//        }
        
        var superview:UIView = self.superview!
        var notification:UIView = self
        var views:NSDictionary = ["superview":superview,"notification":notification]
        
        var metrics:NSDictionary = ["height": 85.0]
        
        var verticalConstraintString:String
        
        if (self.presentFromTop) {
            verticalConstraintString = "V:|[notification(==height)]";
        } else {
            verticalConstraintString = "V:[notification(==height)]|";
        }
        
        
        self.superview?.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(verticalConstraintString, options: NSLayoutFormatOptions(0), metrics: metrics, views: views))
        
        UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.AllowAnimatedContent, animations: {
            self.layoutIfNeeded()
            }, completion:{ finished in

//            if (self.dismissalDelay > 0){
//                var dismissalInvocation:NSIn
//            }
        })
    }
}