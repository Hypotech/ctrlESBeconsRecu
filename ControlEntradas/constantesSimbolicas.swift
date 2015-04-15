//
//  constantesSimbolicas.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 31/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

// MARK: --------------------------
// MARK: Constantes Tabla Historial
// MARK: --------------------------
//Nota: coordenas relativas a su contenedor

let RECT_DIASEM = CGRect(x: 20, y: 0, width: 40, height: 40)
let RECT_FECHA = CGRect(x: RECT_DIASEM.maxX + 12, y: 0, width: 70, height: 30)
let RECT_ENTRADA = CGRect(x: RECT_FECHA.maxX + 12, y: RECT_FECHA.minY, width: RECT_FECHA.width - 10, height: RECT_FECHA.height)
let RECT_SALIDA = CGRect(x: RECT_ENTRADA.maxX + 12, y: RECT_ENTRADA.minY, width: RECT_ENTRADA.width - 6, height: RECT_ENTRADA.height)
let ESPACIO_BOTTOM =  CGFloat(75.0)


// MARK: --------------------------
// MARK: Constantes Celda_Usuario
// MARK: --------------------------
//Nota: coordenas relativas a su contenedor

let R_CLDA_FOTO_USRIO = CGRect(x: 0, y: 0, width: 80, height: 60)
let R_CLDA_NOM_USRIO = CGRect(x: R_CLDA_FOTO_USRIO.maxX + 8, y: ( R_CLDA_FOTO_USRIO.height - 30)/2,
    width: 150, height: 30)
let R_CLDA_IMG_ACCESORY = CGRect(x: R_CLDA_NOM_USRIO.maxX + 30, y: R_CLDA_NOM_USRIO.minY, width: 30, height: R_CLDA_NOM_USRIO.height)

// MARK: ----------------------------
// MARK: Constantes perfil de usuario
// MARK: ----------------------------
//Nota: coordenas relativas a su contenedor
//let RECT_FOTO_USRIO = CGRect(x: <#CGFloat#>, y: <#CGFloat#>, width: <#CGFloat#>, height: <#CGFloat#>)

// MARK: --------------------------
// MARK: Constantes Login
// MARK: --------------------------

let ContraseñaUsuario_Invalido = 400
let OK_login = 200

// MARK: -------------------------------
// MARK: Constantes listaHorizontalMeses
// MARK: -------------------------------

