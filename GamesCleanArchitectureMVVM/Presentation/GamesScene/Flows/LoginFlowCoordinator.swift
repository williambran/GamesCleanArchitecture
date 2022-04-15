//
//  LoginFlowCoordinator.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 18/01/22.
//

import Foundation
import UIKit


protocol FlowCoordinatorDidFinish: AnyObject{
    func LoginFlowCoordinatorDidFinish()
    func GameListFlowCoordinatorDidFinish()
}

protocol LoginFlowCoordinatorProtocol {
    func makeLoginViewController(action: LoginViewModelAction) -> LoginViewController
    func makeRegisterViewController(action: RegisterViewModelAction) -> RegisterViewController
    
}


final class LoginFlowCoordinator: Coordinator {
    var childCoordinators: [AppChildCoordinator : Coordinator]? = [AppChildCoordinator : Coordinator]()
        
    var view: LoginViewController?
    var gameAppSceneDIContainer: LoginFlowCoordinatorProtocol
    weak var patherCoordinator : FlowCoordinatorDidFinish?
    weak var navigationController: UINavigationController?
    
    
    init(gameAppDIContainer: LoginFlowCoordinatorProtocol, navigation: UINavigationController){
        
        self.gameAppSceneDIContainer = gameAppDIContainer
        self.navigationController = navigation
        
    }
    
    func start() {
        //Comenzar a crear viewModel, user case viewModel delegandolos a GamesAppSceneDIContainer para inyeccion
        let actionViewModel =  LoginViewModelAction(showDialogLogin: showDialogLogin, showRegister: showRegister, pruebaGoGameList: goGamesList)
        
        let view = gameAppSceneDIContainer.makeLoginViewController(action: actionViewModel)
        
        navigationController?.topViewController?.removeFromParent()
        navigationController?.pushViewController(view, animated: false)
        
    }
    
    func showLogin() {
        navigationController?.popViewController(animated: true)
    }
 
    
    func showDialogLogin(user: UserLogged)  {
        //Mostarr mensaje de logeado correctamente
        print("usuario \(user.user.nickname) logeado correctamente")
        patherCoordinator?.LoginFlowCoordinatorDidFinish()
        
        
    }
    
    
    func goGamesList() {
        patherCoordinator?.LoginFlowCoordinatorDidFinish()
    }
    
    func showRegister(){
        let actionViewModel = RegisterViewModelAction(showLogin: showLogin)
        let view = gameAppSceneDIContainer.makeRegisterViewController(action: actionViewModel)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.pushViewController(view, animated: true)
        print("inicia el flujo del register")
    }
    
    

    
    deinit {
        print(" 🌈 🌈 LoginFlowCoordinator deinit")
    }
}

