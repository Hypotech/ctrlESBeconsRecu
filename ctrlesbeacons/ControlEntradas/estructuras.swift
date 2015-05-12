//  Aqui se encuentran todas las estructuras de caracter global que pueden ser utilizadas a lo largo todo este proyecto
//
//  Created by desarm on 24/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

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
    var organizacion:NSArray
    var imagenUsuario:UIImage!
    
    init()
    {
        nombre = ""
        telefono = []
        email = []
        organizacion = []
    }
}

enum componentePicker:Int{
    case Dia = 0
    case Mes
    case Año
}

let mesesArray = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]
