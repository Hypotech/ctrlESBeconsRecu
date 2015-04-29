//
//  TerminosYCondiciones_VC.swift
//  ControlEntradas
//
//  Created by desarrolloRM on 24/04/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class TerminosYCondiciones_VC:UIViewController{
    
    // MARK: -----------
    // MARK: Propiedades
    // MARK: -----------
    
    
    // MARK: -------------------
    // MARK: Inicializar widgets
    // MARK: -------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let superVDim = self.view.frame
        
        var btn_atras = UIButton(frame:CGRect(origin: CGPoint(x: 10, y: 30), size:S_BTN_ATRS))
        btn_atras.backgroundColor = UIColor.greenColor()
        
        var lbl_terminosYCondiciones = UILabel(frame:CGRect(x: 10,
                                                y: btn_atras.frame.maxY + 20,
                                                width: superVDim.width - 20 ,
                                                height: superVDim.height - S_BTN_ATRS.height))

        var textoFormateado = NSMutableAttributedString(string: "TERMINOS Y CONDICIONES\n\n" + "Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos. Eu sit tincidunt incorrupte definitionem, vis mutat affert percipit cu, eirmod consectetuer signiferumque eu per. In usu latine equidem dolores. Quo no falli viris intellegam, ut fugit veritus placerat per.Ius id vidit volumus mandamus, vide veritus democritum te nec, ei eos debet libris consulatu. No mei ferri graeco dicunt, ad cum veri accommodare. Sed at malis omnesque delicata, usu et iusto zzril meliore. Dicunt maiorum eloquentiam cum cu, sit summo dolor essent te. Ne quodsi nusquam legendos has, ea dicit voluptua eloquentiam pro, ad sit quas qualisque. Eos vocibus deserunt quaestio ei.")
        
        var parrafoEstilo1 = NSMutableParagraphStyle()
        parrafoEstilo1.alignment = .Center
        parrafoEstilo1.lineBreakMode = .ByTruncatingTail
        
        textoFormateado.addAttribute(NSParagraphStyleAttributeName, value: parrafoEstilo1, range: NSMakeRange(0,22))
        
        var parrafoEstilo2 = NSMutableParagraphStyle()
        parrafoEstilo2.alignment = .Justified
        parrafoEstilo2.lineBreakMode = .ByTruncatingTail
        
        textoFormateado.addAttribute(NSParagraphStyleAttributeName, value: parrafoEstilo2, range: NSMakeRange(23,841))
        
        lbl_terminosYCondiciones.attributedText = textoFormateado
        lbl_terminosYCondiciones.numberOfLines = 0 //automatico

        let limitesSize = lbl_terminosYCondiciones.frame.size
        var tamañoEsperado = lbl_terminosYCondiciones.sizeThatFits(limitesSize)
        lbl_terminosYCondiciones.frame.size = tamañoEsperado
        
//        lbl_terminosYCondiciones.backgroundColor = UIColor.blueColor()
        
        self.view.addSubview(btn_atras)
        self.view.addSubview(lbl_terminosYCondiciones)
    }
}