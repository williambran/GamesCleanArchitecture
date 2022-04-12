//
//  AppDIContainer.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import Foundation
import UIKit


final class AppDIContainer{
    
    lazy var appConfiguration = AppConfiguration()
    
    
    
    lazy var dataTransferService: DataTransferServiceProtocol = {
        
        let networkConfig =  NetworkConfig( baseURL: URL(string: appConfiguration.baseUrlAuth)!,
                                           headers: ["Content-Type": "application/json"] )
        
        let networkService = NetworkServices(networkConfig: networkConfig)
        
        let dataTransferService = DataTransferService(networkServices: networkService)
        
        return dataTransferService
        
    }()
    
    
    
    lazy var dataTransferServicesGames: DataTransferServiceProtocol = {
        let networkingConfing = NetworkConfig(baseURL: URL(string: appConfiguration.baseURL)!,
                                              headers: ["accept": "*/*"])
        
        let networkService = NetworkServices(networkConfig: networkingConfing)
        
        let dataTransferService =  DataTransferService(networkServices: networkService)
        
        return dataTransferService
    }()
    
    
    //MARK: InyectionDependenci ConfigRequest-DB
    
    func makeGameAppSceneDIContainer() -> GamesAppSceneDIContainer {
        
        
        let gameAppSceneDIContainer = GamesAppSceneDIContainer.Dependencies(apiRequest: dataTransferService)
        
        
        return GamesAppSceneDIContainer(dependencies: gameAppSceneDIContainer)
        
    }
    
    
    
    
    //Validar si le corrrespondera el servicio
    func makeListGameSceneDIContainer() -> ListGameSceneDIContainer {
        
        let gameListSceneDIContainer = ListGameSceneDIContainer.Dependencies(apiRequest: dataTransferServicesGames)
        
        return ListGameSceneDIContainer(dependencies: gameListSceneDIContainer)
    }
}
