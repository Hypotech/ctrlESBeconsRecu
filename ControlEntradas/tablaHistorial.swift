//
//  tablaHistorial.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 30/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

// MARK: -----------------------
// MARK: Definicion de la clase
// MARK: -----------------------
class tablaHsitorial:NSObject, UITableViewDataSource, UITableViewDelegate {
    private var viewTabla:UITableView! //Contiene toda la información acerca del historial
    private var lbl_fecha = UILabel()
    private var lbl_entrada = UILabel()
    private var lbl_salida = UILabel()
    var celdaEntradasSalidas:[Cell_EntradaSalida] = []
    
    var view:UIView!
    
    init(superVDim:CGRect){

        super.init()
        lbl_fecha = UILabel(frame: CGRect(x: RECT_FECHA.minX, y: RECT_FECHA.minY,
                                              width: RECT_FECHA.width,
                                              height: RECT_FECHA.height))
        
        lbl_entrada = UILabel(frame: CGRect(x: RECT_ENTRADA.minX, y: RECT_ENTRADA.minY,
                                                width: RECT_ENTRADA.width,
                                                height: RECT_ENTRADA.height))
        
        lbl_salida = UILabel(frame: CGRect( x: RECT_SALIDA.minX, y: RECT_SALIDA.minY,
                                                width: RECT_SALIDA.width,
                                                height: RECT_SALIDA.height))
        lbl_fecha.text = "Fecha"
        lbl_entrada.text = "Entrada"
        lbl_salida.text = "Salida"
        lbl_fecha.textAlignment = .Center
        lbl_entrada.textAlignment = .Center
        lbl_salida.textAlignment = .Center
        
        lbl_fecha.backgroundColor = UIColor.greenColor()
        lbl_entrada.backgroundColor = UIColor.brownColor()
        lbl_salida.backgroundColor = UIColor.yellowColor()
        
        view = UIView(frame: CGRect(  x: 0, y: superVDim.minY,
                                            width: superVDim.width,
                                            height: superVDim.height - superVDim.minY - ESPACIO_BOTTOM))
        
        viewTabla =  UITableView(frame:
                                        CGRect( x: 0, y: RECT_FECHA.maxY,
                                                width: superVDim.width,
                                                height: view.frame.height - RECT_FECHA.height),
                                  style: .Plain)
        
        
        view.addSubview(lbl_fecha)
        view.addSubview(lbl_entrada)
        view.addSubview(lbl_salida)
        view.addSubview(viewTabla)
        
        viewTabla.dataSource = self
        viewTabla.delegate = self
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