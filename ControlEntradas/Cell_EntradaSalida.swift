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
     var lbl_fecha = UILabel()
     var lbl_entrada = UILabel()
     var lbl_salida = UILabel()
     var lbl_DiaSemana = UILabel()
    
    
    var diaMes:Int{
        get{
            return lbl_DiaSemana.text!.toInt()!
        }
        set{
            
            if (0 < newValue && newValue < 10){
                
                lbl_DiaSemana.text = "0" + String(newValue)
            }
            else{
                lbl_DiaSemana.text = String(newValue)
            }
        }
    }
//    var entrada:NSDate =  NSDate()
//    var salida:NSDate =  NSDate()
    
    // MARK: ----------------------------------------
    // MARK: Inicializar widgets y personalizar views
    // MARK: ----------------------------------------
     override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        lbl_fecha.frame = CGRect(x: RECT_FECHA.minX, y: RECT_FECHA.minY,
                                    width: RECT_FECHA.width,
                                    height: RECT_FECHA.height)
        
        lbl_entrada.frame = CGRect( x: RECT_ENTRADA.minX,
                                    y: RECT_ENTRADA.minY,
                                    width: RECT_ENTRADA.width,
                                    height: RECT_ENTRADA.height)
        
        lbl_salida.frame = CGRect ( x: RECT_SALIDA.minX,
                                    y: RECT_SALIDA.minY,
                                    width: RECT_SALIDA.width,
                                    height: RECT_SALIDA.height)
        
        lbl_DiaSemana.frame = CGRect(x: RECT_DIASEM.minX, y: RECT_DIASEM.minY,
                                     width: RECT_DIASEM.width,
                                     height: RECT_DIASEM.height)
        
        //######################### Personalizando los widgets #######################//
        lbl_fecha.backgroundColor = UIColor.greenColor()
        lbl_entrada.backgroundColor = UIColor.brownColor()
        lbl_salida.backgroundColor = UIColor.yellowColor()
        
        lbl_fecha.font = lbl_fecha.font.fontWithSize(11.0)
        lbl_entrada.font = lbl_fecha.font.fontWithSize(11.0)
        lbl_salida.font = lbl_fecha.font.fontWithSize(11.0)
        lbl_DiaSemana.font = lbl_fecha.font.fontWithSize(12.0)
        
        lbl_fecha.textAlignment = .Center
        lbl_entrada.textAlignment = .Center
        lbl_salida.textAlignment = .Center
        lbl_DiaSemana.textAlignment = .Left
        
        lbl_DiaSemana.textColor = UIColor.lightGrayColor()
        //###########################################################################//

        
        lbl_fecha.text = ""
        lbl_entrada.text = ""
        lbl_salida.text = ""
        lbl_DiaSemana.text = "0"
//        lbl_DiaSemana.text = getDayOfWeek(lbl_fecha.text!)
        

        contentView.addSubview(lbl_DiaSemana)
        contentView.addSubview(lbl_fecha)
        contentView.addSubview(lbl_entrada)
        contentView.addSubview(lbl_salida)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: ----------------------------------------
    // MARK: Otros metodos
    // MARK: ----------------------------------------
    
    func getDayOfWeek(today:String) -> String {
        
        let formatter  = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let todayDate = formatter.dateFromString(today)!
        let myCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        
        let myComponents = myCalendar?.components(.WeekdayCalendarUnit, fromDate: todayDate)
        let weekDay = myComponents?.weekday
        
        let dias = ["","Domingo","Lunes", "Martes","Miercoles", "Jueves", "Viernes", "Sabado"]
        return dias[weekDay!]
    }
}