//
//  LoginResponse.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 20/01/22.
//

import Foundation



struct LoginResponseDTO: Decodable {
    let user: UserDTO
    let token:String
}

extension LoginResponseDTO {

}

struct UserDTO: Decodable {
    let id: String
    let email: String
    let names: String
    let nickname: String
    let createdAt: String

}




extension LoginResponseDTO {
    func toDomain()-> UserLogged{
        return .init(token: self.token, user: user.toDomain())
        
    }
}




extension UserDTO {
    func toDomain()-> User {
        let user = User(id: self.id,
                        email: self.email,
                        names: self.names,
                        nickname: self.nickname,
                        createdAt: self.createdAt)
        
        
        return user
    }
}
