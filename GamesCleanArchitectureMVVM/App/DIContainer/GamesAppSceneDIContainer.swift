//
//  GamesAppSceneDIContainer.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import Foundation
import UIKit

///***
//  Maneja login y register **/
 final class GamesAppSceneDIContainer {
    
    struct Dependencies {
        let apiRequest: DataTransferServiceProtocol
    }
    
    private let dependencies: Dependencies
    
    
    init(dependencies: Dependencies){
        self.dependencies = dependencies
    }
    
    
    //MARK: Creator OF flows
    
     func makeLoginFlowCoordinator(navigation: UINavigationController) -> LoginFlowCoordinator {
        
       return LoginFlowCoordinator(gameAppDIContainer: self , navigation: navigation )
    }
     
     
     
     //MARK: Create ViewModels
     func makeLoginViewModel(actions: LoginViewModelAction) -> LoginViewModelInput{
         
         return LoginViewModel(loginUseCase: makeLoginUseCase(), loginViewModelAction: actions)
     }
     
     func makeRegisterViewModel(action: RegisterViewModelAction) -> RegisterViewModelInput {
         return RegisterViewModel(useCase: makeRegisterUseCase(), registerViewMovelAction: action)
     }
     
     
     
     //MARK:  UseCases
     func makeLoginUseCase()-> LoginUseCaseProtocol {
         LoginUseCase(loginRepositorio: makeLoginRepository())
     }
     
     func makeRegisterUseCase() -> RegisterUseCaseProtocol {
         RegisterUseCase(repository: makeRegisterRepository())
     }
     
     
     
     //MARK: Repository
     
     func makeLoginRepository()-> LoginRepositoryProtocol {
         LoginRepository(dataTransferService: dependencies.apiRequest)
     }
     
     
     func makeRegisterRepository() -> RegisterRepositoryProtocol {
         return RegisterRepository(transferServices: dependencies.apiRequest)
     }
     
     deinit {
         print("Se librero la memoria")
     }
    
}



extension GamesAppSceneDIContainer: LoginFlowCoordinatorProtocol {
    func makeRegisterViewController(action: RegisterViewModelAction) -> RegisterViewController {
        
        let view = RegisterViewController.create(viewModel: makeRegisterViewModel(action:action))
        
        return view
    }
    
    
    func makeLoginViewController(action: LoginViewModelAction) -> LoginViewController {
        let view = LoginViewController.create(viewModel: makeLoginViewModel(actions: action) )
        return view
    }
    
    
}




