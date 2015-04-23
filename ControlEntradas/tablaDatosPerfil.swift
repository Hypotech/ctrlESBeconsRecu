//
//  tablaDatosPerfil.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 07/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class tablaDatosPerfil:NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    var viewTabla:UITableView!
    var celdasDatosPerfil:[UITableViewCell] = []
    private var datosPerfil:Perfil
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    init(superVDim:CGRect, datos:Perfil) {

        datosPerfil = datos
        super.init()
        viewTabla = UITableView(frame: CGRect(  x: superVDim.minX, y: superVDim.minY,
                                                width: superVDim.width,
                                                height: superVDim.height - 120.0 - ESPACIO_BOTTOM),
            style: .Grouped)
        
        var celd_nombre = UITableViewCell(style: .Value2, reuseIdentifier: "perfilCelda")
        var celd_organizacion = UITableViewCell(style: .Value2, reuseIdentifier: "perfilCelda")
        var celd_telefono = UITableViewCell(style: .Value2, reuseIdentifier: "perfilCelda")
        var celd_email = UITableViewCell(style: .Value2, reuseIdentifier: "perfilCelda")
        var celd_imagen = UITableViewCell(style: .Default, reuseIdentifier: "perfilCelda")
        
        celd_nombre.textLabel?.text = "Nombre"
        celd_organizacion.textLabel?.text = "Organización"
        celd_telefono.textLabel?.text = "Teléfono"
        celd_email.textLabel?.text = "Email"
        
        var img_usr = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 80))
        celd_imagen.addSubview(img_usr)
        
        celd_nombre.detailTextLabel?.text = datosPerfil.nombre
        celd_organizacion.detailTextLabel?.text = concatenaArray(datosPerfil.organizacion)
        celd_telefono.detailTextLabel?.text = concatenaArray(datosPerfil.telefono)
        celd_email.detailTextLabel?.text = concatenaArray(datosPerfil.email)
        img_usr.image = datosPerfil.imagenUsuario
            
        celdasDatosPerfil = [celd_nombre,celd_organizacion, celd_telefono,celd_email,celd_imagen]
        
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

        if indexPath.section == 0{
            return 100.0
        }
        return 40.0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 1{
            return celdasDatosPerfil[indexPath.row]
        }
        return celdasDatosPerfil[4]
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
            return 1
        }
            return 4
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
    
    private func concatenaArray(array:NSArray) -> String {
        
        var conteo = 0
        var cadenaResult:String = ""
        for i in array {
            
            cadenaResult =  cadenaResult + (i as String)
            if conteo != array.count - 1 {
                cadenaResult = cadenaResult + ", "
            }
            
            conteo++
        }
        return cadenaResult
    }
}