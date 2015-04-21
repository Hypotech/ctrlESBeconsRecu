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
    var anchoCelda = CGFloat(375)
    
    private var lbl_hora_entrada = UILabel()
    private var lbl_hora_salida = UILabel()
    private var lbl_dia = UILabel()
    private var ausencia = true
    private var lbl_ausencia = UILabel()
    private var img_entrada:UIImageView!
    private var img_salida:UIImageView!
    
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
    
    var diaAusente:Bool{
        get{
            return ausencia
        }
        set{
            if newValue {
                lbl_ausencia.hidden = false
                lbl_hora_entrada.hidden = true
                lbl_hora_salida.hidden = true
                img_entrada.hidden = true
                img_salida.hidden = true
            }
            else{
                lbl_ausencia.hidden = true
                lbl_hora_entrada.hidden = false
                lbl_hora_salida.hidden = false
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
     override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //************************** Posicion de los wigets **************************//
        img_entrada = UIImageView(frame:CGRect(x: RECT_DIASEM.maxX + (anchoCelda - RECT_DIASEM.maxX) / 2 - S_IMG_ENTRADA.width - 80,//- 20 - 50 - 10
                                                    y: 0,
                                                    width: S_IMG_ENTRADA.width,
                                                    height: S_IMG_ENTRADA.height))
        
        img_salida = UIImageView(frame:CGRect( x: RECT_DIASEM.maxX + (anchoCelda - RECT_DIASEM.maxX) / 2 + 20,
                                                    y: 0,
                                                    width: S_IMG_SALIDA.width,
                                                    height: S_IMG_SALIDA.height))
        
        lbl_hora_entrada.frame = CGRect(x: img_entrada.frame.maxX + 10,
                                        y: 0,
                                        width: 50,
                                        height: 40)
        
        lbl_hora_salida.frame = CGRect (x: img_salida.frame.maxX + 10,
                                        y: 0,
                                        width: lbl_hora_entrada.frame.width,
                                        height: lbl_hora_entrada.frame.height)
        
        lbl_dia.frame = CGRect(x: RECT_DIASEM.minX, y: RECT_DIASEM.minY,
                                     width: RECT_DIASEM.width,
                                     height: RECT_DIASEM.height)
        
        lbl_ausencia.frame = CGRect(x: RECT_DIASEM.maxX + (anchoCelda - RECT_DIASEM.maxX - S_LBL_AUSENCIA.width) / 2,
                                    y: 0,
                                    width: S_LBL_AUSENCIA.width,
                                    height: S_LBL_AUSENCIA.height)
        
        //***************************************************************************//
        
        //######################### Personalizando los widgets #######################//
        img_entrada.backgroundColor = UIColor.greenColor()
        img_salida.backgroundColor = UIColor.redColor()
        
        lbl_hora_entrada.backgroundColor = UIColor.grayColor()
        lbl_hora_salida.backgroundColor = UIColor.grayColor()
        lbl_dia.backgroundColor = UIColor.blueColor()
        lbl_ausencia.backgroundColor = UIColor.yellowColor()
        
        lbl_hora_entrada.font = UIFont(name: "Lato-Regular", size: 16.0)
        lbl_hora_salida.font = lbl_hora_entrada.font.fontWithSize(16.0)
        lbl_dia.font = lbl_hora_entrada.font.fontWithSize(12.0)
        lbl_ausencia.font = lbl_hora_entrada.font.fontWithSize(17.0)
        
        lbl_hora_entrada.textAlignment = .Center
        lbl_hora_salida.textAlignment = .Center
        lbl_dia.textAlignment = .Left
        lbl_ausencia.textAlignment = .Center
        
        lbl_dia.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        lbl_hora_entrada.textColor = lbl_dia.textColor
        lbl_hora_salida.textColor = lbl_dia.textColor
        lbl_ausencia.textColor = lbl_dia.textColor
        
        lbl_hora_entrada.text = ""
        lbl_hora_salida.text = ""
        lbl_dia.text = "0"
        lbl_ausencia.text = "Ausencia"
        
        diaAusente = true
        
        //###########################################################################//

        contentView.addSubview(lbl_dia)
        contentView.addSubview(img_entrada)
        contentView.addSubview(lbl_hora_entrada)
        contentView.addSubview(img_salida)
        contentView.addSubview(lbl_hora_salida)
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
        else{
            lbl_hora_entrada.text = entrada
            lbl_hora_salida.text = salida
            diaAusente = false
        }
    }
}