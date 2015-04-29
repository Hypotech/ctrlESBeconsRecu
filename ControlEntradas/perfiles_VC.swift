//
//  HorarioControl
//
//  Created by desarm on 25/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class perfiles_VC: UIViewController,SFSwiftNotificationProtocol {

    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    private var tabla: tablaUsuarios!
    private var Usuarios:[Celda_Usuario] = []
    private var btn_Registrar: UIButton!
    private var logoEmpresa:usuario_View!
    private var celdaEntradasSalidas:[Cell_EntradaSalida] = []
    private var registroActual:registrado = .ninguna
    private var arrayAccess:[accesos] = []
    private var beacon = beaconManipulador()
    
    var formatterES = NSDateFormatter()
    var formatterFecha = NSDateFormatter()
    var notifyView:SFSwiftNotification!
    var notifyFrame:CGRect!
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    override func viewDidLoad() {
        println("Cargado en memoria")
        
        super.viewDidLoad()
        self.title = "Perfiles"
        var superVDim = self.view.frame
        getInfo() // Obtener los datos de los usuarios
        
        //************************** Posicion de los wigets **************************//
//        logoEmpresa = usuario_View(superVDim: superVDim)
        tabla = tablaUsuarios(superVDim: superVDim, infoUsuarios: Usuarios,
                                        ViewControlador: self)
        
        btn_Registrar = UIButton.buttonWithType(UIButtonType.System) as UIButton
        
        btn_Registrar.frame = CGRect(x: (superVDim.width - 70 )/2,
                                     y: tabla.viewTabla.frame.maxY + 20.0,
                                     width: 70, height: 35)
        //***************************************************************************//
        
        //######################### Personalizando los widgets #######################//
        btn_Registrar.backgroundColor = UIColor.blueColor();
        btn_Registrar.setTitle("Registrar", forState: .Normal)
        btn_Registrar.addTarget(self, action: "tapRegistrar",
            forControlEvents: UIControlEvents.TouchUpInside)
        notifyFrame = CGRectMake(0, 0, CGRectGetMaxX(self.view.frame), 50)
        notifyView = SFSwiftNotification(frame: notifyFrame,
                                         animationType: AnimationType.AnimationTypeCollision,
                                         direction: Direction.LeftToRight,delegate: self)
    
        formatterES.timeStyle = NSDateFormatterStyle.ShortStyle //Set time style
        formatterES.timeZone = NSTimeZone()
        
        formatterFecha.dateStyle = NSDateFormatterStyle.ShortStyle
        //###########################################################################//
        
        
        self.view.addSubview(tabla.viewTabla)
        self.view.addSubview(btn_Registrar)
        self.view.addSubview(logoEmpresa.container)
        self.view.addSubview(notifyView)
        
//        println("cargado en memoria exitosa")
    }
    
    // MARK: ----------------------------------------
    // MARK: Acciones para la interacción con Buttons
    // MARK: ----------------------------------------
    
    @IBAction func tapRegistrar() {
//        var vc:UIViewController!

        if (beacon.hayBeacon){
            
            if enviaRegistro()
            {
                notifyView!.backgroundColor = UIColor.greenColor()
                notifyView!.label.textColor = UIColor.whiteColor()
                notifyView!.label.text = "Registro Exitoso"
                notifyView.animate(notifyFrame, delay: 1)
            }

//            if i < 2
//            {
//                connection.readTemperatureWithCompletion({ (tempe, error) -> Void in
//                    println(tempe)
//                })
//                
//                i++
//            }
        }
        else{
            println("no hay beacon")
//            vc = storyboard!.instantiateViewControllerWithIdentifier("Fallo Registro") as UIViewController
            notifyView!.backgroundColor = UIColor.redColor()
            notifyView!.label.textColor = UIColor.whiteColor()
            notifyView!.label.text = "Fallo Registro"
            notifyView.animate(notifyFrame, delay: 5)
        }

//        vc.modalPresentationStyle = .OverFullScreen
//        vc.modalTransitionStyle = .CrossDissolve
//        
//        presentViewController(vc, animated: true) {
//            
//        }
        
                self.view.addSubview(notifyView)
    }
    
    // MARK: --------------------------------------------------------------
    // MARK: Funciones delegadas para la interacción con los Notificaciones
    // MARK: --------------------------------------------------------------
    
    func didTapNotification() {
        println("Tap")
    }
    
    func didNotifyFinishedAnimation(results: Bool) {
        
    }
    
    // MARK: -----------------
    // MARK: Obtecion de datos
    // MARK: -----------------
    
    func getInfo(){
        Usuarios.append(Celda_Usuario(style: .Default, reuseIdentifier: "Usuario"))
    }
    
    private var i = 0
    private var primeraVez = true
    func enviaRegistro() -> Bool{
        
        if (registroActual == .ninguna){ //si no hay ningun registro agregamos una celda y se registra la entrada
            
            if primeraVez == true
            {
                primeraVez = false
            }
            else { i++ }
//            
//            celdaEntradasSalidas.append(Cell_EntradaSalida( style: .Default,
//                                                            reuseIdentifier: "Entrada_o_Salida"))
            var entrada = NSDate()
            
//            celdaEntradasSalidas[i].lbl_dia.text = formatterFecha.stringFromDate(entrada)
//            celdaEntradasSalidas[i].lbl_dia.text = getNombreDia(celdaEntradasSalidas[i].lbl_dia.text!)
//            celdaEntradasSalidas[i].lbl_hora_entrada.text = formatterES.stringFromDate(entrada)
        }
        
        else if(registroActual == .entrada){ //si ya hay una entrada registrada,registra la salida
            var salida = NSDate()
//            celdaEntradasSalidas[i].lbl_hora_salida.text = formatterES.stringFromDate(salida)

        }
        else{ //Si se quiere resgitrar una salida segimos registrandola
            var salida = NSDate()
//            celdaEntradasSalidas[i].lbl_hora_salida.text = formatterES.stringFromDate(salida)
        }
        
//        checkInfo()
        tabla.historial = celdaEntradasSalidas
        
        return true
    }
    
//    func checkInfo(){
//        if celdaEntradasSalidas[i].lbl_hora_entrada.text != "" && celdaEntradasSalidas[i].lbl_hora_salida.text == ""
//        {
//            registroActual = .entrada
//            println("Entrada registrada")
//        }
//        else if celdaEntradasSalidas[i].lbl_hora_entrada.text != "" && celdaEntradasSalidas[i].lbl_hora_salida.text != ""
//        {
//            registroActual = .salida
//            println("Salida registrada")
//        }
//        else
//        {
//            registroActual = .ninguna
//            println("Nuevo item")
//        }
//    }
    
    func getNombreDia(today:String) -> String {
        
        let formatter  = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let todayDate = formatter.dateFromString(today)!
        let myCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        
        let myComponents = myCalendar?.components(.WeekdayCalendarUnit, fromDate: todayDate)
        let weekDay = myComponents?.weekday
        
        let dias = ["","Domingo","Lunes", "Martes","Miércoles", "Jueves", "Viernes", "Sábado"]
        return dias[weekDay!]
    }
}