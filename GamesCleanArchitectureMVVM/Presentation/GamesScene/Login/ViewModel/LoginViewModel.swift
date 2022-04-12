//
//  LoginViewModel.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 18/01/22.
//

import Foundation


//considerar agregar validateCorreo y datos del usuario
struct LoginViewModelAction {
    let showDialogLogin:(UserLogged) -> Void
}


protocol LoginViewModelInput {
    func makeLogin(user: LoginRequest)
    func maeRegister()
}



public class LoginViewModel {
   
    var loginUseCase: LoginUseCaseProtocol
    var loginViewModelAction: LoginViewModelAction
    
    
    
    init(loginUseCase: LoginUseCaseProtocol, loginViewModelAction: LoginViewModelAction){
        self.loginUseCase = loginUseCase
        self.loginViewModelAction = loginViewModelAction
    }
    
    
}


extension LoginViewModel: LoginViewModelInput {
    func makeLogin(user: LoginRequest) {
        let loginRequest = LoginRequest(email: user.email, password: user.password)
        let response = loginUseCase.execute(loginRequest: loginRequest) { [weak self] in
            switch $0 {
            case .success(let data):
                print("respueta con la vista \(data)")
                self?.loginViewModelAction.showDialogLogin(data)
            case .failure(let error):
                print("respueta con la vista\(error)")
            }
        }
    }
    
    func maeRegister() {
        print("Implementar registro")
    }
    
    
}
