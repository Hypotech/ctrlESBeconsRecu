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
// Nota: coordenas relativas a su contenedor

let RECT_DIASEM = CGRect(x: 20, y: 0, width: 14, height: 40)
let RECT_DIA = CGRect(x: RECT_DIASEM.maxX + 12, y: 0, width: 70, height: 30)
let S_IMG_ENTRADA = CGSize (width: 40, height: 40)

let S_IMG_SALIDA = S_IMG_ENTRADA
let S_LBL_AUSENCIA = CGSize(width: 90, height: S_IMG_ENTRADA.height)
let ESPACIO_BOTTOM =  CGFloat(75.0)


// MARK: --------------------------
// MARK: Constantes Celda_Usuario
// MARK: --------------------------
// Nota: coordenas relativas a su contenedor

let R_CLDA_FOTO_USRIO = CGRect(x: 0, y: 0, width: 80, height: 60)
let R_CLDA_NOM_USRIO = CGRect(x: R_CLDA_FOTO_USRIO.maxX + 8, y: ( R_CLDA_FOTO_USRIO.height - 30)/2,
    width: 150, height: 30)
let R_CLDA_IMG_ACCESORY = CGRect(x: R_CLDA_NOM_USRIO.maxX + 30, y: R_CLDA_NOM_USRIO.minY, width: 30, height: R_CLDA_NOM_USRIO.height)

// MARK: ----------------------------
// MARK: Constantes perfil de usuario
// MARK: ----------------------------
// Nota: coordenas relativas a su contenedor
//let RECT_FOTO_USRIO = CGRect(x: <#CGFloat#>, y: <#CGFloat#>, width: <#CGFloat#>, height: <#CGFloat#>)

// MARK: --------------------------
// MARK: Constantes Login
// MARK: --------------------------

let ContraseñaUsuario_Invalido = 400
let OK_login = 200

// MARK: ------------------
// MARK: Constantes home_VC
// MARK: ------------------

let ALTURA_IMG_USR =  CGFloat(175.0)
let S_IMG_BEACON = CGSize(width: 70, height: 70)

// MARK: -------------------------
// MARK: Constantes BeaconEncontrado_VC
// MARK: -------------------------
// Nota: coordenas relativas a su contenedor

let S_CONTENEDOR = CGSize(width: 280, height: 180)
let R_IMG_BECON = CGRect(x: 10, y: 10, width: 25, height: 40)
let R_LBL_POPUP = CGRect(x: R_IMG_BECON.maxX + 18, y: R_IMG_BECON.minY + (R_IMG_BECON.height - 30) / 2, width: S_CONTENEDOR.width - R_IMG_BECON.maxX - 22, height: 30)

let R_LBL_HORA = CGRect(x: (S_CONTENEDOR.width - 76) / 2 , y: R_LBL_POPUP.maxY + 16, width: 76, height: 46)
let R_INCONO_E = CGRect(x: (S_CONTENEDOR.width / 2 - 60) , y: S_CONTENEDOR.height - 50 - 10, width: 40, height: 50)
let R_INCONO_S = CGRect(x: (S_CONTENEDOR.width / 2 + 20), y: R_INCONO_E.minY, width: R_INCONO_E.width, height: R_INCONO_E.height)
