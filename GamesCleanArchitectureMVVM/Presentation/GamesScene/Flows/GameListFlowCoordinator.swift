//
//  GameListFlowCoordinator.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 27/01/22.
//

import Foundation
import UIKit

protocol GameListFlowCoordinatorProtocol {
    
    func makeGameListViewController(action: GameListViewmodelAction) -> GamesListViewController
    //func makeGameListViewController(action: GameListPrueba)->GamesListViewController

}



class GameListFlowCoordinator: Coordinator {
    
    var childCoordinators: [AppChildCoordinator : Coordinator]?
    var gameListSceneDIContainer: GameListFlowCoordinatorProtocol
    var navigationController: UINavigationController?
    var patherCoordinator : FlowCoordinatorDidFinish?
    
    init(gameAppDIContainer: GameListFlowCoordinatorProtocol, navigation: UINavigationController){
        
        self.gameListSceneDIContainer = gameAppDIContainer
        self.navigationController = navigation
        
    }
    
    
    
    func start() {
        print("inicializo lista de games")
       
        let prueba =  GameListViewmodelAction(showDetailVideo: prueba())
        let view = gameListSceneDIContainer.makeGameListViewController(action: prueba)
        
        navigationController?.pushViewController(view, animated: false)
        
    }
    
    
    func prueba(){
        //Mostarr mensaje de logeado correctamente
        print("prueba liberacion de memoria")
        patherCoordinator?.coordinatorDidFinish2()
        
    }
    
    
    
    deinit{
        print("liberacion de coordinator")
    }
    
    
    
}

