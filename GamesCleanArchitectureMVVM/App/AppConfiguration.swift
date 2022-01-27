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
        guard let baseUrl = Bundle.main.object(forInfoDictionaryKey: "baseURL") as? String else{
            fatalError("💥💥💥 No se encontro la baseURL")
        }
        return baseUrl
    }()
    
    
}
