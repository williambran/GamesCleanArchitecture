//
//  File.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 23/01/22.
//

import Foundation



class RepositoryTask: Cancellable {
    var networkTask: NetworkCancellable?
    var isCancelled: Bool = false
    
    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
    
    
    
}
