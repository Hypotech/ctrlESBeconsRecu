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
    private var datosPerfil = Perfil()
    private var celd_nacimiento:celda_Fecha!
    private var tFi_nombre:textField_Formulario!
    private var tFi_email:textField_Formulario!
    private var tFi_organizacion:textField_Formulario!
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    
    init(ubicacion:CGRect) {

        super.init()
        
        //****************************** Posicion de los wigets ******************************//
        
        viewTabla = UITableView(frame:  ubicacion,
                                style: .Plain)
        
        tFi_nombre = textField_Formulario(frame:CGRect( x: 0,
                                                        y: 0,
                                                        width: viewTabla.frame.width,
                                                        height: 44))
        
        tFi_email = textField_Formulario(frame: tFi_nombre.frame)
        
        tFi_organizacion = textField_Formulario(frame: tFi_nombre.frame)
        
        celd_nacimiento = celda_Fecha(tamaño: CGSize(width: viewTabla.frame.width, height: 44))
        
        //***********************************************************************************//
        
        //######################### Personalización de los widgets #########################//
        
        var celd_nombre = UITableViewCell(style: .Default, reuseIdentifier: "perfilCelda")
        var celd_organizacion = UITableViewCell(style: .Default, reuseIdentifier: "perfilCelda")
//        var celd_telefono = UITableViewCell(style: .Default, reuseIdentifier: "perfilCelda")
        var celd_email = UITableViewCell(style: .Default, reuseIdentifier: "perfilCelda")
        
        tFi_nombre.textField.placeholder = "Nombre"
        
        tFi_email.textField.placeholder = "Email"
        tFi_email.textField.keyboardType = .EmailAddress
        
        tFi_organizacion.textField.placeholder = "Organización"
        
        celd_nombre.addSubview(tFi_nombre)
        celd_organizacion.addSubview(tFi_organizacion)
//        celd_telefono.addSubview(tFi_nombre)
        celd_email.addSubview(tFi_email)
        
        celdasDatosPerfil = [celd_nombre,celd_organizacion,/* celd_telefono,*/celd_email,celd_nacimiento]
        
        
        viewTabla.separatorStyle = .None
        viewTabla.allowsSelection = true
//        viewTabla.backgroundColor = UIColor.lightGrayColor()
        
        //        viewTabla.scrollEnabled = false
        
        //##################################################################################//
        
        //{{{{{{{{{{{ Delegados }}}}}}}}}}}}
        viewTabla.delegate = self
        viewTabla.dataSource = self
//        celd_nacimiento.tFi_fecha.delegado = self //solo para la celda fecha de nacimiento
        //{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}

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
    
    // MARK: ------------------
    // MARK: Funciones publicas
    // MARK: ------------------
    
    func setPerfil(datos:Perfil){
//        datosPerfil = datos
        
        tFi_nombre.textField.text = datos.nombre
        tFi_email.textField.text = concatenaArray(datos.email)
        tFi_organizacion.textField.text = concatenaArray(datos.telefono)
        
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
