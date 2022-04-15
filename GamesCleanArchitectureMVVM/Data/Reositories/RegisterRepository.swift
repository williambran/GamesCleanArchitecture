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
    func makeRegisterRequest(registerRequest: RegisterRequest, completion: @escaping (Result<UserLogged, Error>) -> Void)  {
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
                print("error request en repositori💥 \(error)")
                break
            }
        }
         
    }
    
    
}
