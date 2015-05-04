/*  Implementa un "Picker" personalizado usado para la seleccion de la fecha de
*   nacimiento en los formularios que se presentan en RegistroXEmail y editarPerfil.
*   El nacimientoPicker es utilizado por la clase celda_Fecha
*
*  nacimientoPicker.swift
*  ControlEntradas
*
*  Created by desarrolloRM on 29/04/15.
*  Copyright (c) 2015 Desarrollo RM. All rights reserved.
*/

import UIKit

protocol nacimientoPickerDelegate{
    func cambioFecha(valor:String, componente:Int)
}

class nacimientoPicker: NSObject, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    var contenedor:UIView
    var delegado:nacimientoPickerDelegate?
    
    private let añosArray:[String]

    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    
    init(frame:CGRect){
        
        var formateadorFecha = NSDateFormatter()
        formateadorFecha.dateFormat = "yyyy"
        
        let añoActual = formateadorFecha.stringFromDate(NSDate()).toInt()!
        let añoLegal = añoActual - 18 //año legal a partir del cual se puede laborar (debe tener 18)
        let añoLimite = añoLegal - 55 // hasta 55 años puede tener un trabajador
        
        var tmp:[String] = []
        for i in añoLimite ... añoLegal{
            tmp.append("\(i)") //creando los Strings desde los Ints
        }
        
        añosArray = tmp
        
        //****************************** Posicion de los wigets ******************************//
        
        contenedor = UIView(frame: frame)
        
        println("alto de contenedor: \(contenedor.frame.height)")
        
        var separador = UIView(frame: CGRect(x: 0, y: 0, width: contenedor.frame.width, height: 0.9))
        
        var pickerFecha = UIPickerView()
        pickerFecha.frame = CGRect( x: 0,
                                    y: separador.frame.maxY,
                                    width: contenedor.frame.width,
                                    height: 180)
        
        //***********************************************************************************//
        super.init()
        
        //######################### Personalización de los widgets #########################//

        separador.backgroundColor = UIColor(red: 0.6, green: 0.2, blue: 0.9, alpha: 1.0)
        
//        contenedor.backgroundColor = UIColor.greenColor()
        pickerFecha.delegate = self
        pickerFecha.dataSource = self
        
//        pickerFecha.contentMode = .ScaleToFill
        //##################################################################################//

        contenedor.addSubview(separador)
        contenedor.addSubview(pickerFecha)

    }
    
    // MARK: ---------------------------------------------------------
    // MARK: Funciones delegadas para la interacción con el datePicker
    // MARK: ---------------------------------------------------------
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat{
        
        let posibleComponente = componentePicker(rawValue: component)!
        
        switch posibleComponente{
        case .Dia:
            return 44
        case .Mes:
            return 128
        case .Año:
            return 76
        }
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{

        let tipo_componente = componentePicker(rawValue: component)!
        
        switch tipo_componente{
        case .Dia:
            return 31
        case .Mes:
            return 12
        case .Año:
            return añosArray.count
        }
    }

    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString?{
        
        let comp_enum = componentePicker(rawValue: component)!
        
        switch comp_enum{
        case .Dia:
            return NSAttributedString(string: "\(row + 1)")
        case .Mes:
            return NSAttributedString(string: mesesArray[row])
        case .Año:
            return NSAttributedString(string: añosArray[row])
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int,inComponent component: Int){

        let comp_enum = componentePicker(rawValue: component)!
        
        switch comp_enum{
        case .Dia:
            delegado?.cambioFecha("\(row + 1)",componente: component)
        case .Mes:
            delegado?.cambioFecha("\(row + 1)",componente: component)
        case .Año:
            delegado?.cambioFecha(añosArray[row],componente: component)
        }
    }
    
    // MARK: ---------------------
    // MARK: Funciones de utilidad
    // MARK: ---------------------
        

}