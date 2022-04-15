//
//  RegisterViewModel.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 13/04/22.
//

import Foundation


protocol RegisterViewModelInput {
    func makeRegister(user: RegisterRequest)
    func goBackToLogin()
}


struct RegisterViewModelAction {
    let showLogin: () -> Void
    
}

class RegisterViewModel {
    
    var registerUseCase : RegisterUseCaseProtocol
    var registerViewModelAction: RegisterViewModelAction
    
    init(useCase: RegisterUseCaseProtocol,registerViewMovelAction: RegisterViewModelAction) {
        self.registerUseCase = useCase
        self.registerViewModelAction = registerViewMovelAction
    }

    deinit {
        print("ReisterViewModel deinit")
    }
}

extension RegisterViewModel: RegisterViewModelInput {
    func goBackToLogin() {
        registerViewModelAction.showLogin()
    }
    
    func makeRegister(user: RegisterRequest) {
        // Hacemos uso del usecase
        registerUseCase.execute(registerRequest: user) { result in
            switch(result){
            case .success(let data):
                // tomar alguna accion alguna accion
                print("Success Register ViewModel: \(data)")
                break
            case .failure(let error):
                break
                
            }
        }
    }
    
    
}
