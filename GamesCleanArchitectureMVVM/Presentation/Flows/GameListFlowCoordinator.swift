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
    weak var patherCoordinator : FlowCoordinatorDidFinish?
    
    init(gameAppDIContainer: GameListFlowCoordinatorProtocol, navigation: UINavigationController){
        
        self.gameListSceneDIContainer = gameAppDIContainer
        self.navigationController = navigation
        
    }
    
    
    
    func start() {
        let prueba =  GameListViewmodelAction(showDetailVideo: prueba)
        let view = gameListSceneDIContainer.makeGameListViewController(action: prueba)
        navigationController?.topViewController?.removeFromParent()
        navigationController?.pushViewController(view, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    
    func prueba(){
        //Mostarr mensaje de logeado correctamente
        print("Nose ejecuta hast que consultemos allGetGames")
        patherCoordinator?.GameListFlowCoordinatorDidFinish()
        
    }
    
    
    
    deinit{
        print("liberacion de GameListFLowcoordinator")
    }
    
    
    
}

