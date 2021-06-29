//
//  CorrigeAcentos.swift
//  TTDD
//
//  Created by Macintosh HD on 15/12/19.
//  Copyright © 2019 Macintosh HD. All rights reserved.
//

import Foundation

class CorrigeAcentos{
    var assunto: String
    init(assunto: String){
        self.assunto = assunto
    }
    func getCorrigeAcentos() -> String {
        assunto = assunto.replacingOccurrences(of: "MÔ", with: "M Ô")
        assunto = assunto.replacingOccurrences(of: "TESÀ", with: "TES À")
        assunto = assunto.replacingOccurrences(of: "OÓ", with: "O Ó")
        assunto = assunto.replacingOccurrences(of: "COMÓ", with: "COM Ó")
        assunto = assunto.replacingOccurrences(of: "AÀ", with: "A À")
        return assunto
    }
}
