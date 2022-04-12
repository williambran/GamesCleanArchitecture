//
//  GamesAppSceneDIContainer.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import Foundation
import UIKit


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
     
     
     
     //MARK:  UseCases
     func makeLoginUseCase()-> LoginUseCaseProtocol {
         LoginUseCase(loginRepositorio: makeLoginRepository())
     }
     
     
     
     //MARK: Repository
     
     func makeLoginRepository()-> LoginRepositoryProtocol {
         LoginRepository(dataTransferService: dependencies.apiRequest)
     }
     
     deinit {
         print("Se librero la memoria")
     }
    
}



extension GamesAppSceneDIContainer: LoginFlowCoordinatorProtocol {
    
    func makeLoginViewController(action: LoginViewModelAction) -> LoginViewController {
        let view = LoginViewController.create(viewModel: makeLoginViewModel(actions: action) )
        return view
    }
    
    func makeRegisterViewController(action: LoginViewModelAction) {
        print("register")
    }
    
    
}




