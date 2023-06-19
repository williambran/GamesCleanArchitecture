//
//  RegisterRepository.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 13/04/22.
//

import Foundation




class RegisterRepository {
    //
    
    var dataTransferServices: DataTransferServiceProtocol
    
    init(transferServices: DataTransferServiceProtocol) {
        self.dataTransferServices = transferServices
    }
}



extension RegisterRepository: RegisterRepositoryProtocol {
    func makeRegisterRequestWithResult(registerRequest: RegisterRequest, completion: @escaping (Result<UserLogged, Error>) -> Void) {
        
        let registerRequestDTO = RegisterRequestDTO(email: registerRequest.email, password: registerRequest.password, names: registerRequest.names)
        let endpoint = Endpoints.register(registerRequestDTO: registerRequestDTO)
        
        dataTransferServices.requestWithCustomResult(endpoint: endpoint) { result in
            switch(result){
            case .success(let data):
                
                completion(.success(data.toDomain()))
                break
            case .failure(let error):
               // let entityError = error.dataCodable! as! ErrorRegisterResponseDTO
                error.dataCodable
                completion(.failure(error))
                break
            }
        }
    }
    
    func makeRegisterRequest(registerRequest: RegisterRequest,
                             completion: @escaping (Result<UserLogged, Error>) -> Void) {
        //usar servicio o base de datos
        let registerRequestDTO = RegisterRequestDTO(email: registerRequest.email, password: registerRequest.password, names: registerRequest.names)
        let endpoint = Endpoints.register(registerRequestDTO: registerRequestDTO)
        
        dataTransferServices.request(endpoint: endpoint) { result in
            switch(result){
            case .success(let data):
                //Conertir respuesta a userLogged y agregarlo al completion
                completion(.success(data.toDomain()))
                break
            case .failure(let error):
                completion(.failure(error))
                print("Leer tipo de error en Repository💥 \(error.localizedDescription)")
                
            }
        }
         
    }
    
    
}







enum WTResultEntity<T:Codable, R:Codable>{
    case success(response: T)
   // case error(error: WTErrors)
    case errorResult(entity: R)
    
    
}



