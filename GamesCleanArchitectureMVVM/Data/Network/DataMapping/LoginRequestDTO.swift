//
//  LoginRequestDTO.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 20/01/22.
//

import Foundation



struct LoginRequestDTO: Encodable {
    let email: String
    let password: String
}
