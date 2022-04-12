//
//  RegisterRequestDTO.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 23/01/22.
//

import Foundation



struct RegisterRequestDTO: Encodable {
    let email: String
    let password: String
    let names: String
}
