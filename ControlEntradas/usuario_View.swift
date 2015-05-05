/* Un view que contiene una imagen de usuario y un filtro
//  usuario_View.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 31/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
*/

import UIKit


class usuario_View{
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    var container:UIView
    
    private var img_usuario:UIImageView?
    private var img_filtro:UIImageView?
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    
    init(ubicacion:CGRect, usuario:UIImage = UIImage(named: "user_desconocido.png")!,
        filtro:UIImage = UIImage (named: "filtro_foto.png")! ){
            
            container = UIView(frame: ubicacion)
            img_usuario = UIImageView(frame: ubicacion)
            img_filtro = UIImageView(frame: ubicacion)
            
            img_filtro?.image = filtro

            img_usuario?.image = usuario
            img_usuario?.contentMode = .ScaleAspectFit
            
            container.backgroundColor = UIColor.brownColor()
            container.addSubview(img_usuario!)
            container.addSubview(img_filtro!)
    }
    
    func setUsuario(imagen:UIImage?){
        
        if (imagen != nil){
            img_usuario!.image = imagen
        }
    }
    
    func setFiltro(imagen:UIImage?){

        if (imagen != nil){
            img_filtro!.image = imagen
        }
    }
    
}