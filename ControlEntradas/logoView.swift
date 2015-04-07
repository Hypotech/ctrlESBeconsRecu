//
//  logoView.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 31/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit


class logoView{
    var container:UIView!
    private var image:UIImageView!
    
    init(superVDim:CGRect, logoimage:UIImage = UIImage(named: "testnavbar.png")!){
        container = UIView(frame: CGRect(x: 0, y: 0, width: superVDim.width, height: 60))
        
        image = UIImageView(image: logoimage)
        image.frame = CGRect(x: 0, y: 0, width: superVDim.width, height: container.frame.height)
        container.backgroundColor = UIColor.brownColor()
        container.addSubview(image)
    }
}