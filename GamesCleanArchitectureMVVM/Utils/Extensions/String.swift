//
//  String.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 24/04/22.
//

import Foundation



extension String {

    var isValidedEmail:Bool{
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}
