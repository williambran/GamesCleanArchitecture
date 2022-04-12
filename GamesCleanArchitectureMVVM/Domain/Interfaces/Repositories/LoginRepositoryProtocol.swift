//
//  LoginRepository.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 20/01/22.
//

import Foundation



protocol LoginRepositoryProtocol {

    func makeLoginRequest(loginRequest: LoginRequest,
                          completion: @escaping (Result<UserLogged, Error>)-> Void)-> Cancellable?

}

