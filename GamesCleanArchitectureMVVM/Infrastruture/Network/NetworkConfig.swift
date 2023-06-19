//
//  NetworkConfig.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import Foundation


protocol NetworkConfigurate {
    var baseURL: URL { get }
    var headers: [String: String] { get }
    var queryParameters: [String: String] { get }
}

public struct NetworkConfig: NetworkConfigurate {
    public let  baseURL: URL
    public let  headers: [String : String]
    public let queryParameters: [String : String]
    
    init(baseURL: URL, headers: [String:String] = [:], queryParameters: [String:String] = [:]){
        
        self.baseURL = baseURL
        self.headers = headers
        self.queryParameters = queryParameters
    }
    
    
}


