//
//  LoginViewModel.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 18/01/22.
//

import Foundation


//considerar agregar validateCorreo y datos del usuario
struct LoginViewModelAction {
    let loginAccess:(User) -> Void
    let makeRegister: () -> Void
}


protocol LoginViewModelInput {
    func loginAccess()
    func maeRegister()
}



class LoginViewModel {
   
}


extension LoginViewModel:LoginViewModelInput {
    func loginAccess() {
        //Hacer algo
    }
    
    func maeRegister() {
        //HHacer algo
    }
    
    
}
