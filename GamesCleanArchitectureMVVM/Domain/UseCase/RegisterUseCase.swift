//
//  RegisterUseCase.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 13/04/22.
//

import Foundation



protocol RegisterUseCaseProtocol {
    func execute(registerRequest: RegisterRequest,
                 completion: @escaping (Result<UserLogged, Error>) -> Void) 
}


class RegisterUseCase {
    //
    var repository:RegisterRepositoryProtocol
    
    init(repository: RegisterRepositoryProtocol) {
        self.repository = repository
    }
}

extension RegisterUseCase: RegisterUseCaseProtocol{
    func execute(registerRequest: RegisterRequest, completion: @escaping (Result<UserLogged, Error>) -> Void)  {
        // hacemos uso del repository
        
        repository.makeRegisterRequest(registerRequest: registerRequest) { result in
            switch(result){
            case .success(let data):
                completion(.success(data))
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
}
