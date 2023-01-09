//
//  TextField.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 24/04/22.
//

import Foundation
import UIKit



protocol ShowErrorMessages {
    var errorMessageLbl: UILabel! { get }
  //  func configureTopErrorMessage(height: Float)
}

extension ShowErrorMessages {
    
    func showError(_ error: String) {
        errorMessageLbl?.text = error
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: {
                self.errorMessageLbl?.alpha = 1
            }) { (finished) in
                
            }
        }
    }
    
    
    func hideError() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 2, animations: {
                self.errorMessageLbl?.alpha = 0
                
            }) { (completed) in
                
            }
        }
    }
    
}

extension UITextField {
    func validate(validation: ValidationTextField) -> ValidationTextField.Result {
        let result = validation.check()
        if !result.success {
            showError(result.message)
        }
        else {
            clearError()
        }
        return result
    }
    func showError(_ error: String, mark: Bool = true) {//comun para validar errores
        configureErrorMessage()
        super.showError(error)  //abre el que esta en la linea 52, por que el UITaxtField hereda del view
        if mark {
            markError()
        }
    }
    func markError()  {
        backgroundColor = UIColor(red: 255.0 / 255.0, green: 255.0 / 234.0, blue: 164.0 / 255.0, alpha: 1)
    }
    func clearError() {
        backgroundColor = UIColor.white
        hideError()
    }
}
