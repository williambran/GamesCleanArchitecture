//
//  ValidationTextField.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 24/04/22.
//

import Foundation


struct ValidationTextField {
    let text: String!
    let type: FieldType
    let options: [FieldOpcion]?
    let required: Bool = false
    
    enum FieldType {
        case email
        case password

    }
    
    struct Result {
        let success: Bool
        let message: String!
        let option : FieldOpcion?
    }
    
    
    enum FieldOpcion {
         
    }
    
    func check() -> Result  {
        var result :Result
        switch type {
        case .email:
            result = checkEmailResult()
        case .password:
            result = checkPasswordResult()
        }
        
        return result
    }

    func checkEmailResult()-> Result{
        if (text.isValidedEmail) {
            return Result(success: true, message: nil, option: nil)
        }
        return Result(success: false, message: "correo incorrecto", option: nil)
    }
    
    func checkPasswordResult() ->Result {
        if text.count < 8 {
            return Result(success: false, message: "La contraseña debe ser mínimo de 8 caracteres.", option: nil)
        }
        return Result(success: true, message: nil, option: nil)
    }
}
