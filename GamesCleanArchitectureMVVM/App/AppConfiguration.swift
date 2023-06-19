//
//  AppConfiguration.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import Foundation

//Clase with configurations Request

class AppConfiguration {
    
    lazy var baseURL: String = {
        guard let baseUrl = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String else{
            fatalError("💥💥💥 No se encontro la baseURL")
        }
        return baseUrl
    }()
    
    
    
    lazy var baseUrlAuth: String = {
        guard let baseUrlAuth = Bundle.main.object(forInfoDictionaryKey: "BaseURLAuth") as? String else {
            fatalError("💥💥💥  No se encontro la baseURLAuth")
        }
        return baseUrlAuth
    }()
    
    
    
}
