//
//  RegisterResponseDTO.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 20/01/22.
//

import Foundation



struct RegisterResponseDTO: Decodable {
    
    let user: UserDTO
    let token: String
    
}
