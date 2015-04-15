//  Administra la tabla que retiene el historial de entradas y salidas, que han sido registradas por
//  el usuario
//
//  Created by desarrolloRM on 30/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class tablaMensualHsitorial:NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    var viewTabla:UITableView! //Tabla que contiene las celdas con información acerca de las entradas y salidas del usuario
    private var celdaEntradasSalidas:[Cell_EntradaSalida] = [] //alamcena las entradas y salidas del usuario
    var fecha:NSDate!
    var numeroDeCeldas:Int
    
    var historial:[Cell_EntradaSalida]{
        get{
            return celdaEntradasSalidas
        }
        set{
            celdaEntradasSalidas = newValue
        }
    }
    
    // MARK: ----------------------------------------
    // MARK: Inicializar widgets y personalizar views
    // MARK: ----------------------------------------
    
    init(ubicacion:CGRect, fecha:NSDate, historial:[Cell_EntradaSalida]){

        let calendario = NSCalendar.currentCalendar()
        self.fecha = fecha
        numeroDeCeldas = calendario.rangeOfUnit(.DayCalendarUnit , inUnit: .MonthCalendarUnit, forDate: fecha).length
        
        super.init()
        
        viewTabla =  UITableView(frame: CGRect (x: ubicacion.minX,
                                                y: ubicacion.minY,
                                                width: ubicacion.width,
                                                height: ubicacion.height),
                                 style: .Plain)
        
        self.historial = historial
        
        viewTabla.dataSource = self
        viewTabla.delegate = self
        
        for var i = 0; i < numeroDeCeldas; i++
        {
            var celda =  Cell_EntradaSalida(style: .Default,reuseIdentifier: "Entrada_o_Salida")
            celda.diaMes = i + 1
            celdaEntradasSalidas.append(celda)
        }
        
    }

    // MARK: ----------------------------------------------------
    // MARK: Funciones delegadas para la interacción con la tabla
    // MARK: ----------------------------------------------------
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celdaEntradasSalidas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return celdaEntradasSalidas[indexPath.row]
    }
}