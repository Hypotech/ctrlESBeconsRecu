//
//  tiempoEnTrabajo.swift
//  HorarioControl
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