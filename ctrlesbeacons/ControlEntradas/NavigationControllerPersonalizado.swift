//
//  NavigationControllerPersonalizado.swift
//  HorarioControl
//
//  Created by desarm on 25/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UiKit

class NavigationControllerPersonalizado:UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}