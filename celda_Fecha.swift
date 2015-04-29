/* Celda para selecionar la fecha de nacimiento
*
*  celda_Fecha.swift
*  ControlEntradas
*
*  Created by desarrolloRM on 28/04/15.
*  Copyright (c) 2015 Desarrollo RM. All rights reserved.
*/

import UIKit

class celda_Fecha: CeldaBase {
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    private var expandido = false
    private var lbl_fechaNacimiento:UILabel
    private var lbl_placeHolder:UILabel
    private var dPik_fecha:UIDatePicker
    
    private var formatoFecha = NSDateFormatter()
    private let anchoCeldaExpandida:CGFloat =  180.0
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    init(tamaño:CGSize){
        
        //****************************** Posicion de los wigets ******************************//
        lbl_placeHolder = UILabel(frame: CGRect(origin: CGPoint.zeroPoint,
                                                size: CGSize(width: 50, height: tamaño.height)))
        
        lbl_fechaNacimiento = UILabel(frame: CGRect( x: tamaño.width - 70,
                                                y: 0,
                                                width: 70,
                                                height: tamaño.height))
        
        
        dPik_fecha = UIDatePicker()
        dPik_fecha.frame = CGRect(x: 0, y: lbl_placeHolder.frame.maxY,
                                width: 200,
                                height: 90)
        
        //***********************************************************************************//
        
        //######################### Personalización de los widgets #########################//
        
       formatoFecha.dateStyle = .ShortStyle
        
        lbl_placeHolder.text = "Fecha de nacimiento"

        lbl_fechaNacimiento.text = "Seleccione"
        lbl_fechaNacimiento.textColor = UIColor.lightGrayColor()
        dPik_fecha.datePickerMode = .Date
        
        //##################################################################################//
        super.init(tamañoAlto: 44.0)
        
        self.addSubview(lbl_placeHolder)
        self.addSubview(lbl_fechaNacimiento)
//        self.addSubview(dPik_fecha)
    }

    required init(coder aDecoder: NSCoder) {
        lbl_placeHolder = UILabel()
        lbl_fechaNacimiento = UILabel()
        dPik_fecha = UIDatePicker()
        super.init(coder: aDecoder)
    }
    
    func abrirDatePicker(tableView: UITableView){
        
        expandido = !expandido
        
        
        if expandido {
            
            //cambiar el color del label segun este expandido o no
            UIView.transitionWithView(lbl_fechaNacimiento, duration: 0.25, options:UIViewAnimationOptions.TransitionCrossDissolve, animations:
                { () -> Void in
                    
                    self.lbl_fechaNacimiento.textColor = UIColor.blueColor()
                    
                }
                , completion: nil)
            
            self.addSubview(dPik_fecha)
            
            alto = anchoCeldaExpandida
        }
        else{
            alto =  44.0
            dPik_fecha.removeFromSuperview()
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}