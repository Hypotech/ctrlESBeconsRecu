//
//  beaconManipulador.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 07/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class beaconManipulador:NSObject ,ESTBeaconManagerDelegate {
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    let beaconManager = ESTBeaconManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D"),
        major: 22373, minor: 48664, identifier: "RepublicaMobile's HeadQuarters") //Beacon ice
    
    var hayBeacon:Bool = false
    
    // MARK: -------------
    // MARK: Constructores
    // MARK: -------------
    override init(){
        super.init()
        
        beaconManager.delegate = self
        region.notifyOnEntry = true
        
        self.beaconManager.requestWhenInUseAuthorization()
        self.beaconManager.startRangingBeaconsInRegion(self.region)
    }
    
    // MARK: -------------------------------------------------------
    // MARK: Funciones delegadas para la interacción con los beacons
    // MARK: -------------------------------------------------------
    
    func beaconManager(manager: ESTBeaconManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        
        if beacons.count > 0 {
            let bTmporal = beacons.first! as CLBeacon
            
            if (/*bTmporal.proximity == .Near ||*/ bTmporal.proximity == .Immediate) {
                
                hayBeacon = true
            }
            else{
                
                hayBeacon = false
            }
        }
        else {
            hayBeacon = false
            println("ningun Beacon")
        }
    }
    
    func beaconManager(manager: ESTBeaconManager!, didEnterRegion region: CLBeaconRegion!) {
        
        //        if region == self.region
        //        {
        var notification : UILocalNotification = UILocalNotification()
        notification.alertBody = "Bienvenido a RepublicaMobile"
        notification.soundName = "Default.mp3"
        println("Youve entered")
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
        //        }
    }

}