//
//  AppFlowCoordinator.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import UIKit



 class AppFlowCoordinator{
    var navigationController: UINavigationController
    var appDIContainer: AppDIContainer
    
    
    init(navigationController : UINavigationController, appDIContainer: AppDIContainer){
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    
    func start(){
        // Reference strong rota
        let gamesAppSceneDIContainer = appDIContainer.makeGameAppSceneDIContainer()
        let loginFowCoordinator = gamesAppSceneDIContainer.makeLoginFlowCoordinator(navigation: navigationController)
        
        loginFowCoordinator.start()
        
    }
    
}
