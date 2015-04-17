//
//  tablaAnualHsitorial.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 15/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class tablaAnualHsitorial:NSObject,listaHorizontalMesesDelegado, UIScrollViewDelegate{
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    private var tablaMes1:tablaMensualHsitorial
    private var tablaMes2:tablaMensualHsitorial
    private var tablaMes3:tablaMensualHsitorial
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
        

        var lineaSeparadora = UIView (frame: CGRect(  x: ubicacionSelectorMes.minX,
                                            y: ubicacionSelectorMes.maxY,
                                            width: ubicacionSelectorMes.width,
                                            height: 1))
        lineaSeparadora.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
        
        contenedorTablas = UIScrollView(frame: CGRect(  x: lineaSeparadora.frame.minX,
                                                        y: lineaSeparadora.frame.maxY,
                                                        width: lineaSeparadora.frame.width,
                                                        height: ubicacion.height  - lineaSeparadora.frame.maxY))
        
        var ubicacionTabla = CGRect(x: 0, y: 0, width: contenedorTablas.frame.width, height: contenedorTablas.frame.height)
        
        tablaMes1 = tablaMensualHsitorial(ubicacion: ubicacionTabla, fecha:NSDate(), historial: CelEntradasSalidas, mesHistorial: .Febrero)
        ubicacionTabla.origin.x = ubicacionTabla.maxX //imediatamente contigua
        tablaMes2 = tablaMensualHsitorial(ubicacion: ubicacionTabla, fecha:NSDate(), historial: CelEntradasSalidas, mesHistorial: .Marzo)
        ubicacionTabla.origin.x = ubicacionTabla.maxX //imediatamente contigua
        tablaMes3 = tablaMensualHsitorial(ubicacion: ubicacionTabla, fecha:NSDate(), historial: CelEntradasSalidas, mesHistorial: .Abril)
        
        selectorMes = listaHorizontalMeses(superVDim: ubicacionSelectorMes, botonesMes: tablaMes1.btnMes,tablaMes2.btnMes, tablaMes3.btnMes)
        //****************************************************************************//
        
        //####################### Personalizando los widgets ########################//
        contenedorTablas.contentSize =  CGSize( width: tablaMes3.viewTabla.frame.maxX,
            height: ubicacionTabla.height) //dimensiones  que tendra el area de scroll
        contenedorTablas.backgroundColor = UIColor.grayColor()
        contenedorTablas.pagingEnabled = true
        //##########################################################################//
        
        contenedorTablas.addSubview(tablaMes2.viewTabla)
        contenedorTablas.addSubview(tablaMes1.viewTabla)
        contenedorTablas.addSubview(tablaMes3.viewTabla)
        
        view.addSubview(selectorMes.viewScroll)
        view.addSubview(lineaSeparadora)
        view.addSubview(contenedorTablas)
        
        super.init()
        selectorMes.delegado = self
        contenedorTablas.delegate = self
    }
    
    func llevarTareaDepuesDeMesSeleccionado(MES:mes, indice:Int){
        irAPagina(indice)
    }
    
    func irAPagina(pagina:Int) {
        
        var medidasContenedor = contenedorTablas.frame
        medidasContenedor.origin.x = CGFloat (pagina) * medidasContenedor.maxX
//        println("\(anchoContenedor)")
        contenedorTablas.scrollRectToVisible(medidasContenedor, animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        
        var indice:Int = Int(scrollView.contentOffset.x / contenedorTablas.frame.width)
            selectorMes.actualizarSeleccion(indice)

    }
}