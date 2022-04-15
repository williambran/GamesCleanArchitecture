//
//  RegisterRepositoryProtocol.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 13/04/22.
//

import Foundation





protocol RegisterRepositoryProtocol {
    
    func makeRegisterRequest(registerRequest: RegisterRequest,
                          completion: @escaping (Result<UserLogged, Error>)-> Void)
}
