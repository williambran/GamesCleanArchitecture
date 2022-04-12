//
//  LoginUseCase.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 19/01/22.
//

import Foundation

//incrustar argumento para db
protocol LoginUseCaseProtocol {
    func execute(loginRequest: LoginRequest,
                 completion: @escaping (Result<UserLogged,Error>) -> Void) -> Cancellable?
}


class LoginUseCase {
    
    //construc Recibe Repositorio
    let loginRepository:  LoginRepositoryProtocol
    

    init(loginRepositorio: LoginRepositoryProtocol){
        self.loginRepository = loginRepositorio
    }
    
    
}

extension LoginUseCase : LoginUseCaseProtocol {
    func execute(loginRequest: LoginRequest, completion: @escaping (Result<UserLogged, Error>) -> Void) -> Cancellable? {
        
       return self.loginRepository.makeLoginRequest(loginRequest: loginRequest) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}





