/*  Clase para el despliegue de una tabla que contiene el historial de entradas y salidas
*   de un mes dado. El historial (mensual) es pasado a traves de la variable celdaEntradasSalidas.
*   La clase tablaMensualHsitorial contiene un boton (de tipo botonMes), que puede ser utilizado
*   con la clase listaHorizontalMeses.
*
*  Created by desarrolloRM on 30/03/15.
*  Copyright (c) 2015 Desarrollo RM. All rights reserved.
*/

import UIKit

protocol tablaMensHistoDelegate{
    func actualizarTabla()
}

class tablaMensualHsitorial:NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    var viewTabla:UITableView! //Tabla que contiene las celdas con información acerca de las entradas y salidas del usuario
    var btnMes:botonMes
    var delegado:tablaMensHistoDelegate?
    
    var historial:[Cell_EntradaSalida]{
        get{
            return celdaEntradasSalidas
        }
        set{
            celdaEntradasSalidas = newValue
        }
    }

    private var celdaEntradasSalidas:[Cell_EntradaSalida] = [] //alamcena las entradas y salidas del usuario
    private var refCtrl_Animacion = UIRefreshControl() //animación de actualización
    
    // MARK: -------------------------------------------
    // MARK: Inicializar y personalizar: widgets y views
    // MARK: -------------------------------------------
    
    init(ubicacion:CGRect, historial:[Cell_EntradaSalida], mesHistorial:mes){

        btnMes = botonMes(nombre: mesHistorial)
        let calendario = NSCalendar.currentCalendar()
        
        super.init()
        
        viewTabla =  UITableView(frame: ubicacion, style: .Plain)
        
        self.historial = historial
        refCtrl_Animacion.addTarget(self, action: "animar", forControlEvents: .ValueChanged)
        refCtrl_Animacion.attributedTitle = NSAttributedString(string: "Actualizando Contenido...")
        refCtrl_Animacion.backgroundColor = UIColor.lightGrayColor()
        
        viewTabla.dataSource = self
        viewTabla.delegate = self
        viewTabla.allowsSelection = false
        viewTabla.addSubview(refCtrl_Animacion)
        
        var celdTmp = Cell_EntradaSalida(ancho: ubicacion.width)
        celdTmp.setCelda("", salida: "")
        celdTmp.diaMes = 1
        celdaEntradasSalidas.append(celdTmp)
//        for var i = 0; i < numeroDeCeldas; i++
//        {
//            var celda =  Cell_EntradaSalida(style: .Default,reuseIdentifier: "Entrada_o_Salida")
//            celda.diaMes = i + 1
//            celdaEntradasSalidas.append(celda)
//        }

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
    
    // MARK: -----------------------------------
    // MARK: Animacion de actualización de datos
    // MARK: -----------------------------------
    func animar(){
        self.delegado?.actualizarTabla()
        refCtrl_Animacion.endRefreshing()
    }

}