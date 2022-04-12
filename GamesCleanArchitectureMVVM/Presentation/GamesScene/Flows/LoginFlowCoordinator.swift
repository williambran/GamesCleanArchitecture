//
//  LoginFlowCoordinator.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 18/01/22.
//

import Foundation
import UIKit


protocol FlowCoordinatorDidFinish{
    func coordinatorDidFinish()
    func coordinatorDidFinish2()
}

protocol LoginFlowCoordinatorProtocol {
    func makeLoginViewController(action: LoginViewModelAction) -> LoginViewController
    func makeRegisterViewController(action: LoginViewModelAction)
    
}


final class LoginFlowCoordinator: Coordinator {
    var childCoordinators: [AppChildCoordinator : Coordinator]?
        
    var view: LoginViewController?
    var gameAppSceneDIContainer: LoginFlowCoordinatorProtocol
    var patherCoordinator : FlowCoordinatorDidFinish?
    weak var navigationController: UINavigationController?
    
    
    init(gameAppDIContainer: LoginFlowCoordinatorProtocol, navigation: UINavigationController){
        
        self.gameAppSceneDIContainer = gameAppDIContainer
        self.navigationController = navigation
        
    }
    
    func start() {
        //Comenzar a crear viewModel, user case viewModel delegandolos a GamesAppSceneDIContainer para inyeccion
        let actionViewModel =  LoginViewModelAction(showDialogLogin: showDialogLogin)
        
        let view = gameAppSceneDIContainer.makeLoginViewController(action: actionViewModel)
        
        navigationController?.pushViewController(view, animated: false)
        
    }
    
 
    
    //get user and token
    func showDialogLogin(user: UserLogged)  {
        //Mostarr mensaje de logeado correctamente
        print("usuario \(user.user.nickname) logeado correctamente")
        patherCoordinator?.coordinatorDidFinish()
        
        
    }
    
    
    func makeRegister()  {
        //Aquie hacer proceso de registro
    }
    
    deinit {
        print(" 🌈 🌈prueba liberando memoria")
    }
}

