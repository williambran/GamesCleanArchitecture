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


enum AppChildCoordinator {
    case login
    case register
    case listGames
}

class AppFlowCoordinator : Coordinator {
    
    var childCoordinators: [AppChildCoordinator:Coordinator]? = [AppChildCoordinator:Coordinator]()
    var navigationController: UINavigationController?
     var gamesAppSceneDIContainer: GamesAppSceneDIContainer?
    weak var appDIContainer: AppDIContainer?
    
    
    init(navigationController : UINavigationController, appDIContainer: AppDIContainer){
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    
    func start(){
        /// Reference strong eliminada al eliminar coordinator
         gamesAppSceneDIContainer = appDIContainer?.makeGameAppSceneDIContainer()
        let loginFowCoordinator = gamesAppSceneDIContainer?.makeLoginFlowCoordinator(navigation: navigationController!)
        loginFowCoordinator?.patherCoordinator = self
        loginFowCoordinator?.start()
        childCoordinators?[.login] = loginFowCoordinator
        
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
    func coordinatorDidFinish() {
        // finalizar coordinator
        
        childCoordinators?[.login] = nil

        
        //Inicializar coordinator a dashboard
        
        gameListFlowCoordinator()
        
    }
    
    
    func coordinatorDidFinish2()  {
        childCoordinators?[.listGames] = nil
    }
    
    
}
