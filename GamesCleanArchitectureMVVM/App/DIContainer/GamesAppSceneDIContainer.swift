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
    
}



extension GamesAppSceneDIContainer: FlowCoordinatorProtocol {
    func makeViewModel() {
        // 
    }
    
    func makeDetailsGameViewController() {
        //
    }
    
    func makeSearchGameListViewController() {
        //
    }
    

    
    
}
