/*  Clase que maneja el despligue de los datos de perfil del usuario en una tabla, asi como la
*   invocaión de las funciones delegadas, dado un evento de edición.
*
*  tablaDatosPerfil.swift
*  ControlEntradas
*
*  Created by desarrolloRM on 07/04/15.
*  Copyright (c) 2015 Desarrollo RM. All rights reserved.
*/

import UIKit

class tablaDatosPerfil:NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    var viewTabla:UITableView!
//    var delegado:tablaPerfildelegate!
    
    private var celdasDatosPerfil:[UITableViewCell] = []
    private var datosPerfil:Perfil
    private var celd_nacimiento:celda_Fecha!
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    init(ubicacion:CGRect, datos:Perfil) {

        datosPerfil = datos
        super.init()
        
        //****************************** Posicion de los wigets ******************************//
        
        viewTabla = UITableView(frame: CGRect(  x: ubicacion.minX, y: ubicacion.minY,
                                                width: ubicacion.width,
                                                height: ubicacion.height - 120.0 - ESPACIO_BOTTOM),
                                style: .Grouped)

        println("ancho de un reglon: \(viewTabla.frame.width)")
        
        var tFi_nombre = textField_Formulario(frame:CGRect( x: 0,
                                                        y: 0,
                                                        width: viewTabla.frame.width,
                                                        height: 44))
        
        var tFi_email = textField_Formulario(frame: tFi_nombre.frame)
        
        var tFi_organizacion = textField_Formulario(frame: tFi_nombre.frame)
        
        celd_nacimiento = celda_Fecha(tamaño: CGSize(width: viewTabla.frame.width, height: 44))
        
        //***********************************************************************************//
        
        //######################### Personalización de los widgets #########################//
        
        var celd_nombre = UITableViewCell(style: .Default, reuseIdentifier: "perfilCelda")
        var celd_organizacion = UITableViewCell(style: .Default, reuseIdentifier: "perfilCelda")
//        var celd_telefono = UITableViewCell(style: .Default, reuseIdentifier: "perfilCelda")
        var celd_email = UITableViewCell(style: .Default, reuseIdentifier: "perfilCelda")
        
        tFi_nombre.textField.placeholder = "Nombre"
//            datosPerfil.nombre
        tFi_email.textField.placeholder = "Email"
//            concatenaArray(datosPerfil.email)
        tFi_organizacion.textField.placeholder = "Organización"
//            concatenaArray(datosPerfil.organizacion)
        
        celd_nombre.addSubview(tFi_nombre)
        celd_organizacion.addSubview(tFi_organizacion)
//        celd_telefono.addSubview(tFi_nombre)
        celd_email.addSubview(tFi_email)
        
        celdasDatosPerfil = [celd_nombre,celd_organizacion,/* celd_telefono,*/celd_email,celd_nacimiento]
        //##################################################################################//
        
        //{{{{{{{{{{{ Delegados }}}}}}}}}}}}
        viewTabla.delegate = self
        viewTabla.dataSource = self
//        celd_nacimiento.tFi_fecha.delegado = self //solo para la celda fecha de nacimiento
        //{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}
        
        viewTabla.separatorStyle = .None
        viewTabla.allowsSelection = true
        viewTabla.userInteractionEnabled = true
//        viewTabla.scrollEnabled = false
    }
    
    // MARK: ----------------------------------------------------
    // MARK: Funciones delegadas para la interacción con la tabla
    // MARK: ----------------------------------------------------

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return celdasDatosPerfil[indexPath.row]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celdasDatosPerfil.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var celda = celdasDatosPerfil[indexPath.row]
        
        if celda.isKindOfClass( celda_Fecha){
            
            var cel_fecha = celda as celda_Fecha
            return cel_fecha.alto
        }
        return 44.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var celda = celdasDatosPerfil[indexPath.row]
        
        if celda.isKindOfClass(celda_Fecha){
            
            var cel_fecha = celda as celda_Fecha
            cel_fecha.abrirDatePicker(tableView)
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: ---------------------
    // MARK: Funciones de utilidad
    // MARK: ---------------------
    
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
    
//    func textFieldSeleccionado(_:String){
//        celd_nacimiento.abrirDatePicker(viewTabla)
//    }
}
