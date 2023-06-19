//
//  GameListRepositoryProtocol.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 11/04/22.
//

import Foundation




protocol GameListRepositoryProtocol {
    
    func getAllGames(completion: @escaping(Result<GameList, Error>)-> Void ) -> Cancellable?
    
}
