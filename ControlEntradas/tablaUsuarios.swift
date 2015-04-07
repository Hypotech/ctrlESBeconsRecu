//
//  tablaUsuarios.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 31/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class tablaUsuarios:NSObject, UITableViewDataSource, UITableViewDelegate {
    var viewTabla:UITableView!
    private var Usuarios:[CeldaBase] = []
    var ViewControlador:UIViewController
    var historial:[Cell_EntradaSalida] = []
    
    init(superVDim:CGRect, datosUsuarios:[CeldaBase], viewArriba:UIViewController, historial:[Cell_EntradaSalida]){
        self.ViewControlador = viewArriba
        super.init()
        
        viewTabla = UITableView(frame: CGRect(  x: 0, y: 120,
                                                width: superVDim.width,
                                                height: superVDim.height - 120.0 - ESPACIO_BOTTOM))
        viewTabla.delegate = self
        viewTabla.dataSource = self
        Usuarios = datosUsuarios

        self.historial = historial
//        viewTabla.allowsSelection = false
    }
    
    
    // MARK: ----------------------------------------------------
    // MARK: Funciones delegadas para la interacción con la tabla
    // MARK: ----------------------------------------------------
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Usuarios.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Usuarios[indexPath.row].alto
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return Usuarios[indexPath.row]
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        var historialViewController = historial_VC()
//        var navController = UINavigationController(rootViewController: historialViewController)
//        historialViewController.celdaEntradasSalidas = historial //pasamos el historial
//        
//        //        navController.transitioningDelegate = self.animator! //agregar una animación personalizada
//        ViewControlador.presentViewController(navController, animated: true, completion: nil)
//    }
    
}