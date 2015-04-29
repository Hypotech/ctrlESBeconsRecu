//
//  constantesSimbolicas.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 31/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

// MARK: --------------------------
// MARK: Constantes login1eraVez_VC
// MARK: --------------------------

// Nota: coordenas relativas a su contenedor

let S_REG_EMAIL = CGSize(width: 300, height: 50)
let S_REG_PODIO = S_REG_EMAIL

// MARK: -----------------------------
// MARK: Constantes registroEmail_VC
// MARK: -----------------------------

// Nota: coordenas relativas a su contenedor
struct xHeight{
    let x:CGFloat = 55
    let  height:CGFloat = 100
}

let A_IMG_EMP = xHeight()

let S_BTN_REG = S_REG_EMAIL

// MARK: -----------------------------
// MARK: Constantes Cell_EntradaSalida
// MARK: -----------------------------

// Nota: coordenas relativas a su contenedor

let RECT_DIA = CGRect(x: 18, y: 0, width: 14, height: 28)
let S_IMG_ENTRADA = CGSize (width: 30, height: 30)
let S_LBL_ENTRADA = CGSize (width: 72, height: 30)

let S_IMG_SALIDA = S_IMG_ENTRADA
let S_LBL_SAL_PEN = S_LBL_ENTRADA
let S_LBL_AUSENCIA = CGSize(width: 70, height: S_IMG_ENTRADA.height)
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
// MARK: Constantes Login PODIO
// MARK: --------------------------

let ContraseñaUsuario_Invalido = 400
let OK_login = 200

// MARK: --------------------
// MARK: Constantes inicio_VC
// MARK: --------------------

let P_ALT_IMG_USR:CGFloat =  0.3927 /*CGFloat(175.0)*/
let S_IMG_BEACON = CGSize(width: 70, height: 70)

// MARK: -----------------------------
// MARK: Constantes de editarPerfil_VC
// MARK: -----------------------------

let S_BTN_GUAR = S_REG_EMAIL
let S_V_CFB = CGSize(width: 210, height: 96)

// MARK: ------------------------------
// MARK: Constantes BeaconEncontrado_VC
// MARK: ------------------------------
// Nota: coordenas relativas a su contenedor

let S_CONTENEDOR = CGSize(width: 282, height: 198)
let R_IMG_BECON = CGRect(x: 10, y: 10, width: 30, height: 45)
let R_LBL_POPUP = CGRect(x: R_IMG_BECON.maxX + 18, y: R_IMG_BECON.minY + (R_IMG_BECON.height - 30) / 2, width: S_CONTENEDOR.width - R_IMG_BECON.maxX - 22, height: 30)

let R_LBL_HORA = CGRect(x: (S_CONTENEDOR.width - 80) / 2 , y: R_LBL_POPUP.maxY + 16, width: 80, height: 46)
let R_ICONO_E = CGRect(x: (S_CONTENEDOR.width / 2 - 45 - 20) , y: S_CONTENEDOR.height - 45 - 38, width: 45, height: 45)
let R_ICONO_S = CGRect(x: (S_CONTENEDOR.width / 2 + 20), y: R_ICONO_E.minY, width: R_ICONO_E.width, height: R_ICONO_E.height)

let R_LBL_A_E = CGRect(x: R_ICONO_E.minX, y: R_ICONO_E.maxY + 8, width: R_ICONO_E.width, height: 12)
let R_LBL_A_S = CGRect(x: R_ICONO_S.minX, y: R_LBL_A_E.minY, width: R_ICONO_S.width, height: R_LBL_A_E.height)

// MARK: -------------------------
// MARK: Colores
// MARK: -------------------------
let verde_textoSelect = UIColor(red: 15/255, green: 133/255, blue: 134/255, alpha: 1.0)
let verde_textoDeselect = UIColor(red: 208/255, green: 229/255, blue: 229/255, alpha: 1.0)
let rojo_texto = UIColor(red: 239/255, green: 96/255, blue: 96/255, alpha: 1.0)
let gris_texto = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
let naranja_texto = UIColor.orangeColor()

// MARK: ----------------------------------
// MARK: Constantes TerminosYCondiciones_VC
// MARK: ----------------------------------

let S_BTN_ATRS = CGSize(width: 40, height: 40)
