//
//  UIView.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 24/04/22.
//

import Foundation
import UIKit




extension UIView: ShowErrorMessages {
    var errorMessageLbl: UILabel! {
        subviews.filter {
            $0.tag == 24 && $0 is UILabel
        }.first as? UILabel
    }
    
    
    func configureErrorMessage() {
        let errorLbl = createLbl(frame: CGRect(x: bounds.origin.x, y: bounds.size.height, width: bounds.size.width, height: 16))
        errorLbl.backgroundColor = UIColor.clear
        errorLbl.textColor = UIColor.red
        errorLbl.font = UIFont.systemFont(ofSize: 13)
        clipsToBounds = false
    }
    
    func createLbl(frame: CGRect) -> UILabel {//el frame esel espacio para addletrasrojasdebajo del textfiled
        var errorLbl = subviews.filter {
            $0.tag == 24 && $0 is UILabel
        }.first as? UILabel
        if errorLbl == nil {
            errorLbl = UILabel(frame: frame)
            errorLbl?.tag = 24
        }
        //errorLbl?.textAlignment = .center
        errorLbl?.alpha = 0
        errorLbl?.numberOfLines = 0
        errorLbl?.adjustsFontSizeToFitWidth = true
        errorLbl?.minimumScaleFactor = 0.5
        if errorLbl?.superview == nil {
            addSubview(errorLbl!)
        }
        bringSubviewToFront(errorLbl!) //mueve el subview al final , en el button aparecera el msn del error
        return errorLbl!
    }
    
}
