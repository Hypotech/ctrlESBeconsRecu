//
//  tablaConfig.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 07/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class tablaConfig:NSObject, UITableViewDataSource, UITableViewDelegate {
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    var viewTabla:UITableView!
    var configuraciones:[UITableViewCell] = []
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    init(superVDim:CGRect, datos:[UITableViewCell]) {
        super.init()
        viewTabla = UITableView(frame: CGRect(  x: superVDim.minX, y: superVDim.minY,
                                                width: superVDim.width,
                                                height: superVDim.height - 120.0 - ESPACIO_BOTTOM),
            style: .Grouped)
        
        configuraciones = datos
        
//        viewTabla.backgroundColor = UIColor.greenColor()
        
        viewTabla.delegate = self
        viewTabla.dataSource = self
    }
    
    // MARK: ----------------------------------------------------
    // MARK: Funciones delegadas para la interacción con la tabla
    // MARK: ----------------------------------------------------
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40.0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return configuraciones[indexPath.row]
    }
    

//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        var historialViewController = historial_VC()
//        var navController = UINavigationController(rootViewController: historialViewController)
//        historialViewController.celdaEntradasSalidas = historial //pasamos el historial
//        
//        //        navController.transitioningDelegate = self.animator! //agregar una animación personalizada
//        ViewControlador.presentViewController(navController, animated: true, completion: nil)
//    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 2
        }
        else if (section == 1){
            return 4
        }
        return 0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var lbl_header = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 30))
        
        if  section == 0{
            lbl_header.text = "Foto"
        }
        else{
            lbl_header.text = "Generales"
        }
        return lbl_header
    }

}