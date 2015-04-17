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
    var lbl_dia = UILabel()
    var lbl_hora_entrada = UILabel()
    var lbl_hora_salida = UILabel()
    var lbl_DiaSemana = UILabel()
    var anchoCelda = CGFloat(375)
    
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
        
        var img_entrada = UIImageView(frame:CGRect(x: RECT_DIASEM.maxX + (anchoCelda - RECT_DIASEM.maxX) / 2 - S_IMG_ENTRADA.width - 80,//- 20 - 50 - 10
                                                    y: 0,
                                                    width: S_IMG_ENTRADA.width,
                                                    height: S_IMG_ENTRADA.height))
        
        var img_salida = UIImageView(frame:CGRect( x: RECT_DIASEM.maxX + (anchoCelda - RECT_DIASEM.maxX) / 2 + 20,
                                                    y: 0,
                                                    width: S_IMG_SALIDA.width,
                                                    height: S_IMG_SALIDA.height))
        
        var lbl_ausencia = UILabel (frame: CGRect(  x: (anchoCelda - RECT_DIASEM.maxX - S_LBL_AUSENCIA.width) / 2,
                                                    y: 0,
                                                    width: S_LBL_AUSENCIA.width,
                                                    height: S_LBL_AUSENCIA.height))
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        lbl_dia.frame = CGRect(x: RECT_DIA.minX, y: RECT_DIA.minY,
//                                    width: RECT_DIA.width,
//                                    height: RECT_DIA.height)
        
        lbl_hora_entrada.frame = CGRect(x: img_entrada.frame.maxX + 10,
                                        y: 0,
                                        width: 50,
                                        height: 40)
        
        lbl_hora_salida.frame = CGRect (x: img_salida.frame.maxX + 10,
                                        y: 0,
                                        width: lbl_hora_entrada.frame.width,
                                        height: lbl_hora_entrada.frame.height)
        
        lbl_DiaSemana.frame = CGRect(x: RECT_DIASEM.minX, y: RECT_DIASEM.minY,
                                     width: RECT_DIASEM.width,
                                     height: RECT_DIASEM.height)
        
        //######################### Personalizando los widgets #######################//
//        lbl_dia.backgroundColor = UIColor.greenColor()
        img_entrada.backgroundColor = UIColor.greenColor()
        img_salida.backgroundColor = UIColor.redColor()
        
        lbl_hora_entrada.backgroundColor = UIColor.grayColor()
        lbl_hora_salida.backgroundColor = UIColor.grayColor()
        lbl_DiaSemana.backgroundColor = UIColor.blueColor()
        
//        lbl_dia.font = lbl_dia.font.fontWithSize(11.0)
        lbl_hora_entrada.font = lbl_hora_entrada.font.fontWithSize(11.0)
        lbl_hora_salida.font = lbl_hora_entrada.font.fontWithSize(11.0)
        lbl_DiaSemana.font = lbl_hora_entrada.font.fontWithSize(12.0)
        
//        lbl_dia.textAlignment = .Center
        lbl_hora_entrada.textAlignment = .Center
        lbl_hora_salida.textAlignment = .Center
        lbl_DiaSemana.textAlignment = .Left
        
        lbl_DiaSemana.textColor = UIColor.lightGrayColor()
        
        //        lbl_dia.text = ""
        lbl_hora_entrada.text = ""
        lbl_hora_salida.text = ""
        lbl_DiaSemana.text = "0"
        //        lbl_DiaSemana.text = getDayOfWeek(lbl_dia.text!)
        
        //###########################################################################//

        contentView.addSubview(lbl_DiaSemana)
//        contentView.addSubview(lbl_dia)
        contentView.addSubview(img_entrada)
        contentView.addSubview(lbl_hora_entrada)
        contentView.addSubview(img_salida)
        contentView.addSubview(lbl_hora_salida)
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