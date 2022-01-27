//
//  LoginFlowCoordinator.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 18/01/22.
//

import Foundation
import UIKit


protocol FlowCoordinatorProtocol {
    func makeViewModel()
    func makeDetailsGameViewController()
    func makeSearchGameListViewController()
    
}


final class LoginFlowCoordinator{
    
    var gameAppSceneDIContainer: FlowCoordinatorProtocol
    var navigation: UINavigationController
    
    
    init(gameAppDIContainer: FlowCoordinatorProtocol, navigation: UINavigationController){
        
        self.gameAppSceneDIContainer = gameAppDIContainer
        self.navigation = navigation
        
    }
    
    func start(){
        //Comenzar a crear viewModel, user case viewModel delegandolos a GamesAppSceneDIContainer para inyeccion
        
        gameAppSceneDIContainer.makeViewModel()
        
    }
    
 
}
