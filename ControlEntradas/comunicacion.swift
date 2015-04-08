//
//  comunicacion.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 07/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class comunicacion:NSObject{
    
    private var registroActual:registrado = .ninguna
    private var i = 0
    private var primeraVez = true
    
//    func enviaRegistro() -> Bool{
//        
//        if (registroActual == .ninguna){ //si no hay ningun registro agregamos una celda y se registra la entrada
//            
//            if primeraVez == true
//            {
//                primeraVez = false
//            }
//            else { i++ }
//            
//            celdaEntradasSalidas.append(Cell_EntradaSalida( style: .Default,
//                reuseIdentifier: "Entrada_o_Salida"))
//            var entrada = NSDate()
//            
//            celdaEntradasSalidas[i].lbl_fecha.text = formatterFecha.stringFromDate(entrada)
//            celdaEntradasSalidas[i].lbl_DiaSemana.text = getDayOfWeek(celdaEntradasSalidas[i].lbl_fecha.text!)
//            celdaEntradasSalidas[i].lbl_entrada.text = formatterES.stringFromDate(entrada)
//        }
//            
//        else if(registroActual == .entrada){ //si ya hay una entrada registrada,registra la salida
//            var salida = NSDate()
//            celdaEntradasSalidas[i].lbl_salida.text = formatterES.stringFromDate(salida)
//            
//        }
//        else{ //Si se quiere resgitrar una salida segimos registrandola
//            var salida = NSDate()
//            celdaEntradasSalidas[i].lbl_salida.text = formatterES.stringFromDate(salida)
//        }
//        
//        checkInfo()
//        tabla.historial = celdaEntradasSalidas
//        
//        return true
//    }
    
//    func checkInfo(){
//        if celdaEntradasSalidas[i].lbl_entrada.text != "" && celdaEntradasSalidas[i].lbl_salida.text == ""
//        {
//            registroActual = .entrada
//            println("Entrada registrada")
//        }
//        else if celdaEntradasSalidas[i].lbl_entrada.text != "" && celdaEntradasSalidas[i].lbl_salida.text != ""
//        {
//            registroActual = .salida
//            println("Salida registrada")
//        }
//        else
//        {
//            registroActual = .ninguna
//            println("Nuevo item")
//        }
//    }
}