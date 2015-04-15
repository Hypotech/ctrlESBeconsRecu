//
//  tablaAnualHsitorial.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 15/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class tablaAnualHsitorial:NSObject,listaHorizontalMesesDelegado{
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    private var tablaExample1:tablaMensualHsitorial
    private var tablaExample2:tablaMensualHsitorial
    private var selectorMes:listaHorizontalMeses //seleciona el mes que se desea consultar su historial
    private var contenedorTablas:UIScrollView
    var CelEntradasSalidas:[Cell_EntradaSalida] = []
    var view:UIView! //contiene todos los elementos graficos (widgets) de un historial
    
    // MARK: ----------------------------------------
    // MARK: Inicializar widgets y personalizar views
    // MARK: ----------------------------------------
    
    init(ubicacion:CGRect){

        //*************************** Posicion de los wigets ************************** //
        view = UIView(frame: ubicacion)
        
        let ubicacionSelectorMes = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        
        selectorMes = listaHorizontalMeses(superVDim: ubicacionSelectorMes)
        var lineaSeparadora = UIView (frame: CGRect(  x: ubicacionSelectorMes.minX,
                                            y: ubicacionSelectorMes.maxY,
                                            width: ubicacionSelectorMes.width,
                                            height: 1))
        lineaSeparadora.backgroundColor = UIColor.lightGrayColor()
        
        contenedorTablas = UIScrollView(frame: CGRect(  x: lineaSeparadora.frame.minX,
                                                        y: lineaSeparadora.frame.maxY,
                                                        width: lineaSeparadora.frame.width,
                                                        height: ubicacion.height  - lineaSeparadora.frame.maxY))
        
        var ubicacionTabla = CGRect(x: 0, y: 0, width: contenedorTablas.frame.width, height: contenedorTablas.frame.height)
        
        tablaExample1 = tablaMensualHsitorial(ubicacion: ubicacionTabla, fecha:NSDate(), historial: CelEntradasSalidas)
        ubicacionTabla.origin.x = ubicacionTabla.maxX //imediatamente contigua
        tablaExample2 = tablaMensualHsitorial(ubicacion: ubicacionTabla, fecha:NSDate(), historial: CelEntradasSalidas)

        //****************************************************************************//
        
        //####################### Personalizando los widgets ########################//
        contenedorTablas.contentSize =  CGSize( width: tablaExample2.viewTabla.frame.maxX,
            height: ubicacionTabla.height)
        contenedorTablas.backgroundColor = UIColor.grayColor()
        contenedorTablas.pagingEnabled = true
        //##########################################################################//
        
        contenedorTablas.addSubview(tablaExample2.viewTabla)
        contenedorTablas.addSubview(tablaExample1.viewTabla)
        view.addSubview(selectorMes.viewContent)
        view.addSubview(lineaSeparadora)
        view.addSubview(contenedorTablas)
        
        super.init()
        selectorMes.delegado = self
    }
    
    func llevarTareaBotonPresionado(MES:mes){
        println("Mes: \(MES)")
    }
    
}