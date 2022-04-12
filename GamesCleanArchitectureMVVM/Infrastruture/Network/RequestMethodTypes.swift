//
//  RequestMethodTypes.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 17/01/22.
//

import Foundation




public enum RequestMethodTypes: String, CaseIterable {
    case GET
    case POST
    case PUT
    case DELETE
    
    var value: String {
        return self.rawValue
        
    }
}


public enum BodyEncoding {
    case jsonSerializationData
    case stringEncodingAscii
}


public enum RequestGenerationError: Error {
    case components 
}


// MARK: Errror In the tranfering
public enum DataTranferError: Error {
    case noResponse
    case networkFailure(NetworkError)
    case parsing(Error)
    
}


// MARK: Errror request
public enum NetworkError: Error {
    case error(statusCode: Int, data: Data?)
    case notConnected
    case cancelled
    case generic(Error)
    case urlGeneration
}


