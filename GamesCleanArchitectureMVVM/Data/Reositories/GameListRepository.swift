//
//  GameListRepository.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 11/04/22.
//

import Foundation





class GameListRepository {
    
    private var dataTransferServices : DataTransferServiceProtocol
    
    init(dataTransferServices: DataTransferServiceProtocol ){
        self.dataTransferServices = dataTransferServices
    }
}


extension GameListRepository : GameListRepositoryProtocol {
    
    func getAllGames(completion: @escaping (Result<GameList, Error>) -> Void) -> Cancellable? {
        //hacer request al dataTransferServices
        let endPoint = Endpoints.getAllGames()
        let task = RepositoryTask()
        
        
        task.networkTask = self.dataTransferServices.request(endpoint: endPoint) { result in
            switch(result){
                
            case .success(let data):
                completion(.success(data.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        return task
    }
    
    
}
