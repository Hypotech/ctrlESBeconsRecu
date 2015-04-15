//  Aqui se encuentran todas las estructuras de caracter global que pueden ser utilizadas a lo largo todo este proyecto
//
//  Created by desarm on 24/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

struct accesos {
    var fechaEntrada:NSDate
    var fechaSalida:NSDate
}

enum registrado{
    case ninguna
    case entrada
    case salida
}

enum mes{
    case Ninguno
    case Enero
    case Febrero
    case Marzo
    case Abril
    case Mayo
    case Junio
    case Julio
    case Agosto
    case Septiembre
    case Octubre
    case Noviembre
    case Diciembre
}

struct Perfil {
    var nombre:String
    var telefono:NSArray
    var email:NSArray
    var empresa:String
    var imagenUsuario:UIImage!
    
    init()
    {
        nombre = ""
        telefono = []
        email = []
        empresa = ""
    }
}