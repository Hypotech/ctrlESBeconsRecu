/* Celda para selecionar la fecha de nacimiento
*
*  celda_Fecha.swift
*  ControlEntradas
*
*  Created by desarrolloRM on 28/04/15.
*  Copyright (c) 2015 Desarrollo RM. All rights reserved.
*/

import UIKit

class celda_Fecha: CeldaBase,nacimientoPickerDelegate {
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    var dia:Int{
        get{
            return fechaArray[0].toInt()!
        }
        set{
            if (0 > newValue && newValue <= diasXmes[fechaArray[1].toInt()!]){
                fechaArray[0] = "\(newValue)"
            }
        }
    }
    
    var mes:u_int{
        get{
            return u_int (fechaArray[1].toInt()!)
        }
        set{
            if (mes > 0 && mes < 13){
                fechaArray[1] = "\(newValue)"
            }
        }
    }
    
    var año:Int{
        get{
            return fechaArray[2].toInt()!
        }
        set{
            fechaArray[2] = "\(newValue)"
        }
    }
    
    private var fechaArray = ["1","1","1942"]
    private let diasXmes = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    private var expandido = false
    private var lbl_placeHolder:UILabel
    private var Pick_fecha:nacimientoPicker
    private var formatoFecha = NSDateFormatter()
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    
    init(tamaño:CGSize){
        
        //****************************** Posicion de los wigets ******************************//
        lbl_placeHolder = UILabel(frame: CGRect(x: 10, y: 0, width: tamaño.width - 20, height: tamaño.height))
        
        let alturaEsquinas = tamaño.height * 0.2
        
        var linea_izq = UIView(frame: CGRect(x: grosorLinea,
            y: tamaño.height - alturaEsquinas,
            width: grosorLinea,
            height: alturaEsquinas) )
        
        var linea_der = UIView(frame: CGRect(x: tamaño.width - grosorLinea,
            y: linea_izq.frame.minY,
            width: grosorLinea,
            height: alturaEsquinas) )
        
        var linea_baja = UIView(frame:CGRect(x: linea_izq.frame.maxX,
            y: linea_izq.frame.maxY - grosorLinea,
            width: linea_der.frame.minX - linea_izq.frame.maxX,
            height: grosorLinea))
        
        Pick_fecha = nacimientoPicker(frame: CGRect(x: 0, y: lbl_placeHolder.frame.maxY,
            width: tamaño.width,
            height: 190))
        
        //***********************************************************************************//
        
        //######################### Personalización de los widgets #########################//
        
        formatoFecha.dateStyle = .ShortStyle
        
        lbl_placeHolder.text = "Fecha de nacimiento"
        lbl_placeHolder.textColor = UIColor(white: 0.76,alpha: 1.0)
        
        linea_baja.backgroundColor = UIColor.lightGrayColor()
        linea_izq.backgroundColor = linea_baja.backgroundColor
        linea_der.backgroundColor = linea_baja.backgroundColor
        //##################################################################################//
        super.init(tamañoAlto: 44.0)
        
        Pick_fecha.delegado = self
        self.addSubview(linea_baja)
        self.addSubview(linea_izq)
        self.addSubview(linea_der)
        self.addSubview(lbl_placeHolder)
        //        self.addSubview(Pick_fecha) //lo dejamos que se agregue en el delegado
    }
    
    required init(coder aDecoder: NSCoder) {
        lbl_placeHolder = UILabel(coder: aDecoder)
        Pick_fecha = nacimientoPicker(frame: CGRect.zeroRect)
        super.init(coder: aDecoder)
    }
    
    // MARK: ---------------------
    // MARK: Funciones publicas
    // MARK: ---------------------
    func abrirDatePicker(tableView: UITableView){
        
        expandido = !expandido
        
        
        if expandido {
            
            //cambiar el color del label segun este expandido o no
            //            UIView.transitionWithView(lbl_fechaNacimiento, duration: 0.25, options:UIViewAnimationOptions.TransitionCrossDissolve, animations:
            //                { () -> Void in
            //
            //                    self.lbl_fechaNacimiento.textColor = UIColor.blueColor()
            //
            //                }
            //                , completion: nil)
            
            self.addSubview(self.Pick_fecha.contenedor)
            
            alto = self.Pick_fecha.contenedor.frame.height + 44.0
            lbl_placeHolder.textColor = UIColor.lightGrayColor()
        }
        else{
            alto =  44.0
            Pick_fecha.contenedor.removeFromSuperview()
            lbl_placeHolder.textColor = UIColor.blackColor()
            
            lbl_placeHolder.text = concatenaArray(fechaArray)
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    // MARK: ------------------------------------
    // MARK: Funciones delegadas nacimientoPicker
    // MARK: ------------------------------------
    func cambioFecha(valor:String, componente:Int){
        
        let posibleComponente = componentePicker(rawValue: componente)!
        
        switch posibleComponente{
        case .Dia:
            fechaArray[0] = valor
        case .Mes:
            fechaArray[1] = valor
        case .Año:
            fechaArray[2] = valor
        }
        
        lbl_placeHolder.text = concatenaArray(fechaArray)
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
                cadenaResult = cadenaResult + "/"
            }
            
            conteo++
        }
        return cadenaResult
    }
}