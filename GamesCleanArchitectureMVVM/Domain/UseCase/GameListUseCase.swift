//
//  GameListUseCase.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 11/04/22.
//

import Foundation

protocol GameListUseCaseProtocol {
    func execute( completion:@escaping (Result<GameList,Error>) -> Void) -> Cancellable?
    
}




class GameListUseCase {
    
    var repository: GameListRepositoryProtocol
    
    init(repository: GameListRepositoryProtocol) {
        self.repository = repository
    }


}

extension GameListUseCase : GameListUseCaseProtocol {
    func execute( completion: @escaping (Result<GameList, Error>) -> Void) -> Cancellable? {
        
      return  repository.getAllGames { result in
          switch result{
          case .success(let data):
              completion(.success(data))
          case .failure(let error):
              completion(.failure(error))
          }
          
        }
    }
    
    
}
