//
//  ListGameSceneDIContainer.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 11/04/22.
//

import Foundation
import UIKit






class ListGameSceneDIContainer {
    
    
    struct Dependencies {
        let apiRequest: DataTransferServiceProtocol
    }
    
    private let dependencies: Dependencies

    
    init(dependencies: Dependencies){
        self.dependencies = dependencies
    }
    
    
    
    func makeGameListFlowCoordinator(navigation: UINavigationController) -> GameListFlowCoordinator {
        
        return GameListFlowCoordinator(gameAppDIContainer: self, navigation: navigation)
    }
    
    
    //::MARK: Create ViewModel
    func makeGameListViewModel(action: GameListViewmodelAction ) -> GamesListViewModelProtocol {
        GamesListViewModel(gameListUseCase: makeGameListUseCases(), gameListViewModelAction: action)
    }
    
    
    //::MARK: Create UsesCases
    func makeGameListUseCases() -> GameListUseCaseProtocol {
        GameListUseCase(repository: makeGameListRepository())
    }
    
    //::MARK: Create Reposity
    func makeGameListRepository()-> GameListRepositoryProtocol{
        GameListRepository(dataTransferServices: dependencies.apiRequest)
    }
    
    deinit{
        print("liberacion de injector ListGames 🟢")
    }
    
    
    
}
extension ListGameSceneDIContainer : GameListFlowCoordinatorProtocol {
    
    
    func makeGameListViewController(action: GameListViewmodelAction)->GamesListViewController {
        let view = GamesListViewController.create(viewModel: makeGameListViewModel(action: action))
        
        return view
    }

    
    //Comienza la inyeccion para el lisView
    
   
    
  /*  func makeGameListViewController(action: GameListViewmodelAction) {
        //hacer algo
    }
    */
    
}
