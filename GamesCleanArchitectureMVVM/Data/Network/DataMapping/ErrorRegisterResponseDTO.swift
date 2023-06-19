//
//  ErrorRegisterResponseDTO.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 16/04/22.
//

import Foundation




struct ErrorRegisterResponseDTO: Decodable, Error {
    let error: String
}



extension ErrorRegisterResponseDTO {
    func toDomain() -> ErrorRegisterDomain {
        .init(error: error)
    }
    
}




struct ErrorRegisterDomain {
    let error: String
}
