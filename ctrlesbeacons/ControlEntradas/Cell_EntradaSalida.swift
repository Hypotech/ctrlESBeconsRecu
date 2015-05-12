//
//  Cell_EntradaSalida.swift
//  HorarioControl
//
//  Created by desarm on 24/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class Cell_EntradaSalida:CeldaBase {

    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    var diaMes:Int{
        get{
            return lbl_dia.text!.toInt()!
        }
        set{
            
            if (0 < newValue && newValue < 10){
                
                lbl_dia.text = "0" + String(newValue)
            }
            else{
                lbl_dia.text = String(newValue)
            }
        }
    }
    
    private var anchoCelda:CGFloat = 0
    private var lbl_hora_entrada = UILabel()
    private var lbl_horaSalida_o_pendiente = UILabel()
    private var lbl_dia = UILabel()
    private var ausencia = true
    private var lbl_ausencia = UILabel()
    private var img_entrada:UIImageView!
    private var img_salida:UIImageView!

    private var diaAusente:Bool{
        get{
            return ausencia
        }
        set{
            if newValue {
                lbl_ausencia.hidden = false
                lbl_hora_entrada.hidden = true
                lbl_horaSalida_o_pendiente.hidden = true
                img_entrada.hidden = true
                img_salida.hidden = true
            }
            else{
                lbl_ausencia.hidden = true
                lbl_hora_entrada.hidden = false
                lbl_horaSalida_o_pendiente.hidden = false
                img_entrada.hidden = false
                img_salida.hidden = false
            }
            
            ausencia = newValue
        }
    }
    

//    var entrada:NSDate =  NSDate()
//    var salida:NSDate =  NSDate()
    
    // MARK: ----------------------------------------
    // MARK: Inicializar widgets y personalizar views
    // MARK: ----------------------------------------
    init(ancho:CGFloat) {
        
        anchoCelda = ancho
        
        super.init(style: .Default, reuseIdentifier: "EntradaSalida")
        
        //************************** Posicion de los wigets **************************//
        img_entrada = UIImageView(frame:CGRect(x: RECT_DIA.maxX + (anchoCelda - RECT_DIA.maxX) / 2 - S_IMG_ENTRADA.width - S_LBL_ENTRADA.width - 30,//- 20 - 10 (espacios ÷ cda. elemento)
                                                    y: (self.frame.height - S_IMG_ENTRADA.height) / 2,
                                                    width: S_IMG_ENTRADA.width,
                                                    height: S_IMG_ENTRADA.height))
        
        img_salida = UIImageView(frame:CGRect( x: RECT_DIA.maxX + (anchoCelda - RECT_DIA.maxX) / 2 + 20,
                                                    y: (self.frame.height - S_IMG_SALIDA.height) / 2,
                                                    width: S_IMG_SALIDA.width,
                                                    height: S_IMG_SALIDA.height))
        
        lbl_hora_entrada.frame = CGRect(origin: CGPoint(x: img_entrada.frame.maxX + 10,
                                                        y: (self.frame.height - S_LBL_ENTRADA.height) / 2),
                                        size: S_LBL_ENTRADA)
        
        lbl_horaSalida_o_pendiente.frame = CGRect(origin: CGPoint(x: img_salida.frame.maxX + 10,
                                                                  y: (self.frame.height - S_LBL_SAL_PEN.height) / 2),
                                                  size: S_LBL_SAL_PEN)
        
        lbl_dia.frame = CGRect( origin: CGPoint(x: RECT_DIA.minX, y: (self.frame.height - RECT_DIA.height) / 2),
                                size: RECT_DIA.size)
        
        lbl_ausencia.frame = CGRect(origin: CGPoint(x: RECT_DIA.maxX + (anchoCelda - RECT_DIA.maxX - S_LBL_AUSENCIA.width) / 2,
                                                    y: 0),
                                    size: S_LBL_AUSENCIA)
        
        //***************************************************************************//
        
        //######################### Personalizando los widgets #######################//
        img_entrada.image = UIImage(named: "icono_entrada")
        img_salida.image = UIImage(named: "icono_salida")
        
//        lbl_hora_entrada.backgroundColor = UIColor.grayColor()
//        lbl_horaSalida_o_pendiente.backgroundColor = UIColor.grayColor()
//        lbl_dia.backgroundColor = UIColor.blueColor()
//        lbl_ausencia.backgroundColor = UIColor.yellowColor()
        
        lbl_hora_entrada.font = UIFont(name: "Lato-Regular", size: 16.0)
        lbl_horaSalida_o_pendiente.font = lbl_hora_entrada.font.fontWithSize(16.0)
        lbl_dia.font = lbl_hora_entrada.font.fontWithSize(12.0)
        lbl_ausencia.font = lbl_hora_entrada.font.fontWithSize(17.0)
        
        lbl_hora_entrada.textAlignment = .Center
        lbl_horaSalida_o_pendiente.textAlignment = .Center
        lbl_dia.textAlignment = .Left
        lbl_ausencia.textAlignment = .Center
        
        lbl_dia.textColor = gris_texto
        lbl_hora_entrada.textColor = lbl_dia.textColor
        lbl_horaSalida_o_pendiente.textColor = lbl_dia.textColor
        lbl_ausencia.textColor = lbl_dia.textColor
        
        lbl_hora_entrada.text = ""
        lbl_horaSalida_o_pendiente.text = ""
        lbl_dia.text = "0"
        lbl_ausencia.text = "Ausencia"
        
        diaAusente = true
        
        //###########################################################################//

        contentView.addSubview(lbl_dia)
        contentView.addSubview(img_entrada)
        contentView.addSubview(lbl_hora_entrada)
        contentView.addSubview(img_salida)
        contentView.addSubview(lbl_horaSalida_o_pendiente)
        contentView.addSubview(lbl_ausencia)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: ----------------------------------------
    // MARK: Metodos publicos
    // MARK: ----------------------------------------
    
    func getNombreDia(fecha:String) -> String { //fecha debe estar de forma MM/dd/yyyy
        
        let formatter  = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let todayDate = formatter.dateFromString(fecha)!
        let myCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        
        let myComponents = myCalendar?.components(.WeekdayCalendarUnit, fromDate: todayDate)
        let weekDay = myComponents?.weekday
        
        let dias = ["","Domingo","Lunes", "Martes","Miercoles", "Jueves", "Viernes", "Sabado"]
        return dias[weekDay!]
    }
    
    func setCelda(entrada:String,salida:String){
        if entrada == "" && salida == ""{
            diaAusente = true
        }
        else if entrada != "" && salida == ""{
            lbl_hora_entrada.text = entrada
            lbl_horaSalida_o_pendiente.text = "Pendiente"
            lbl_horaSalida_o_pendiente.textColor = rojo_texto
            lbl_horaSalida_o_pendiente.textAlignment = .Left
            diaAusente = false
            img_salida.hidden = true
        }
        else{
            lbl_hora_entrada.text = entrada
            lbl_horaSalida_o_pendiente.text = salida
            lbl_horaSalida_o_pendiente.textColor = lbl_dia.textColor
            lbl_horaSalida_o_pendiente.textAlignment = .Center
            diaAusente = false
        }
    }
}