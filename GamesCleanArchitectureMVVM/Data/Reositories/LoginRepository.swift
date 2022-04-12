//
//  LoginRepository.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 20/01/22.
//

import Foundation
 


 class LoginRepository {
    
    
    //Recibe el DataTransferService y el de la DB
    
    private let dataTranferService: DataTransferServiceProtocol
    
    init(dataTransferService: DataTransferServiceProtocol){
        self.dataTranferService = dataTransferService
    }
}

extension LoginRepository: LoginRepositoryProtocol {
    
    func makeLoginRequest(loginRequest: LoginRequest, completion: @escaping (Result<UserLogged, Error>) -> Void) ->Cancellable? {
        
        let loginRequestDTO = LoginRequestDTO(email: loginRequest.email, password: loginRequest.password)
        let endPoint = Endpoints.login(loginRequestDTO: loginRequestDTO)
        let task = RepositoryTask()
        
        task.networkTask = dataTranferService.request(endpoint: endPoint) { result in
            switch result {
            case .success(let response):
                
                completion(.success(response.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task
    }

}


