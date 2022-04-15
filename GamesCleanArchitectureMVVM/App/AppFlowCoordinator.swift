//
//  AppFlowCoordinator.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import UIKit


protocol Coordinator {
    var childCoordinators: [AppChildCoordinator:Coordinator]? { get set }
    var navigationController: UINavigationController? { get set }

    func start()
}
/*
extension Coordinator {
    
    /// Removing a coordinator inside a children. This call is important to prevent memory leak.
    /// - Parameter coordinator: Coordinator that finished.
    func childDidFinish(_ coordinator : Coordinator){
        // Call this if a coordinator is done.
        for (index, child) in childCoordinators.enumerated() {
            if child === coordinator {
                children.remove(at: index)
                break
            }
        }
    }
}*/


enum AppChildCoordinator {
    case login
    case register
    case listGames
}

class AppFlowCoordinator : Coordinator {
    
    var childCoordinators: [AppChildCoordinator:Coordinator]? = [AppChildCoordinator:Coordinator]()
    var navigationController: UINavigationController?
    // var gamesAppSceneDIContainer: GamesAppSceneDIContainer?
    weak var appDIContainer: AppDIContainer?
    
    
    init(navigationController : UINavigationController, appDIContainer: AppDIContainer){
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    
    func start(){
        /// Reference strong eliminada al eliminar coordinator
        let gamesAppSceneDIContainer = appDIContainer?.makeGameAppSceneDIContainer()
        let loginFowCoordinator = gamesAppSceneDIContainer?.makeLoginFlowCoordinator(navigation:navigationController!)
        loginFowCoordinator?.patherCoordinator = self
        childCoordinators?[.login] = loginFowCoordinator
        loginFowCoordinator?.start()
        
    }
    
    
    func gameListFlowCoordinator() {
        let gameListSceneDIContainer =  appDIContainer?.makeListGameSceneDIContainer()
        let gameListFlowCoordinator = gameListSceneDIContainer?.makeGameListFlowCoordinator(navigation: navigationController! )
        gameListFlowCoordinator?.patherCoordinator = self
        gameListFlowCoordinator?.start()
        childCoordinators?[.listGames] = gameListFlowCoordinator
    }
    
}

extension AppFlowCoordinator: FlowCoordinatorDidFinish{
    func LoginFlowCoordinatorDidFinish() {
        childCoordinators?[.login] = nil
        gameListFlowCoordinator()
        
    }
    
    func GameListFlowCoordinatorDidFinish() {
        childCoordinators?[.listGames] = nil
        start()
        
    }

}
