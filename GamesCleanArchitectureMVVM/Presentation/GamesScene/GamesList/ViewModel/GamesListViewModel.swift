//
//  ListGamesViewModel.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import Foundation




struct GameListViewmodelAction {
    let showDetailVideo:()->Void
}


protocol GamesListViewModelProtocol{
    func getAllGamesList()
    func pru()
}


class GamesListViewModel {
    
    var gameListViewModelAction: GameListViewmodelAction
    var gameListUseCase: GameListUseCaseProtocol
    
    init(gameListUseCase: GameListUseCaseProtocol ,gameListViewModelAction: GameListViewmodelAction) {
        self.gameListViewModelAction = gameListViewModelAction
        self.gameListUseCase = gameListUseCase
    }
    
    
}
extension GamesListViewModel: GamesListViewModelProtocol{
    func getAllGamesList() {
        //Hacer peticion
        _ =  gameListUseCase.execute { result in
            
            switch(result){
            case .success(let data):
                print("usar el data para presentar el resultado en view \(data)")
                self.gameListViewModelAction.showDetailVideo()
                
            case .failure(let error):
                print("error en traer las lista de jjuegos \(error) ")
            }
        }
    }
    
    func pru(){
        self.gameListViewModelAction.showDetailVideo()
    }
    
    
}
