//
//  HorarioControl
//
//  Created by desarm on 24/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIkit


class horarios_Tabla: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tble_historial: UITableView!
    
    var horarios:[CeldaBase] = []
    
    var setHorarios:[CeldaBase] {
        get{
            return horarios
        }
        set {
            
            horarios = newValue
        }
    }
    

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        tble_historial.delegate = self
        tble_historial.dataSource = self
    }
    
    //################################### funciones para control del table view #################################
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { //forzoso para implementar el protocolo
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horarios.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return horarios[indexPath.row].alto
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        horarios[indexPath.row].setNeedsUpdateConstraints()
        horarios[indexPath.row].updateConstraintsIfNeeded()
        return horarios[indexPath.row] //retorna la celda
    }
    //#############################################################################################################

}