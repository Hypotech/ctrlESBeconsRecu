//
//  DetalleUsuario.swift
//  HorarioControl
//
//  Created by desarm on 24/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class DetalleUsuario: horarios_Tabla {
    
    
    var entradasSalidas:[CeldaBase] = [
        CeldaTitulo(style: UITableViewCellStyle.Default, reuseIdentifier: "Titulo celda"),
        CeldaTitulo(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Titulo celda"),
    ]
    
//    var horariosBeacons:[tiempo] = [tiempo(fechaEntrada: NSDate(), fechaSalida: NSDate())]
    
    override func viewDidLoad() {
        
        super.setHorarios = entradasSalidas
        super.viewDidLoad()
        
//        func getInfo(){
//            var formateadorFecha = NSDateFormatter()
//            formateadorFecha.dateStyle = NSDateFormatterStyle.ShortStyle
//            formateadorFecha.timeZone = NSTimeZone()
//            
//            var horarios = Cell_EntradaSalida(style: UITableViewCellStyle.Default, reuseIdentifier: "Celda Horario")
//            for var i = 0; i < entradasSalidas.count; i++
//            {
//                horarios.lbl_hora_entrada.text = formateadorFecha.stringFromDate(horariosBeacons[i].fechaEntrada)
//                horarios.lbl_hora_salida.text = formateadorFecha.stringFromDate(horariosBeacons[i].fechaSalida)
//                horarios.lbl_dia.text = formateadorFecha.stringFromDate(horariosBeacons[i].fechaEntrada)
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}