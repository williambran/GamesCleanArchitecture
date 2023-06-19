//
//  APIEndpoint.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 20/01/22.
//

import Foundation



struct Endpoints {
    
    
    static func login(loginRequestDTO: LoginRequestDTO ) -> EndPoint<LoginResponseDTO,LoginResponseDTO>{
        
        return EndPoint(path: "api/v1/auth", isFullPath: false, method: .POST, bodyParametersEncodable: loginRequestDTO)
    }
    
    
    static func register(registerRequestDTO: RegisterRequestDTO) -> EndPoint<RegisterResponseDTO,ErrorRegisterResponseDTO> {
        
        return EndPoint(path: "api/v1/register", method: .POST,bodyParametersEncodable: registerRequestDTO)
    }
    
    
    static func getAllGames() ->EndPoint<GamesListDTO, GamesListDTO> {
        
        return EndPoint(path: "api/games", method: .GET)
    }
}
