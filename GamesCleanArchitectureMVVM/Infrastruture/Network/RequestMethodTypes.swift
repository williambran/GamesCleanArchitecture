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
    case errorResponse
    case parsing(Error)
    
}
public enum DataTranferErrorCustom<Y>: Error {
    case noResponse
    case errorResult(entity: Y)
    case networkFailure(NetworkError)
    case errorResponse
    case parsing(Error)
}

// MARK: Errror request
public enum NetworkError: Error {
    case error(statusCode: Int, data: Data?)
    case errorDecode(data: Decodable)
    case notConnected
    case cancelled
    case generic(Error)
    case urlGeneration
}





extension DataTranferError: LocalizedError {
    
 /*
    var error: Error  {
        
        switch self {
        case .noResponse:
            break
        case .networkFailure(let networkError):
            return networkError.errorNetwork
            break
        case .errorResponse:
            break
        case .parsing(let error):
            break
        }
        
        
    }*/
}


extension NetworkError: LocalizedError {
    
    var hasDataError: Bool {
        
        switch self {
        case .error(_, _):
            return true
            
        case .notConnected:
            return false
            
        case .cancelled:
            return false
            
        case .generic(_):
            return false
            
        case .urlGeneration:
            return false
            
        case .errorDecode:
            return false
            
        }
    }
    
    
    
    var errorData: Data? {
        guard case let NetworkError.error(statusCode: _, data: data) = self
               else {  return nil }
        return data
    }

    
    
}


extension Error {
    
    public var hasDataError: Bool {
        guard  let error = self as? dataError, error.hasDataError  else { return false }
        return  true
    }
    
    public var dataCodable: Any? {
        guard  let error = self as? dataError else { return nil }
        
        return  error.getResultError()
        
    }
    

    
}

protocol dataError{
    func getResultError()->Any
    var hasDataError: Bool { get }
}

extension DataTranferErrorCustom: dataError {
    var hasDataError: Bool {
        guard case DataTranferErrorCustom.errorResult(_) = self else { return false }
        return true
    }
    
    func getResultError() -> Any {
        return dataCodable as Any
    }
    

    
    
    
    public var dataCodable: Any? {
        guard case let DataTranferErrorCustom.errorResult(entity) = self else { return nil }
        return entity
        
    }
/*    var data: String{
        switch(self){
        case .errorResult(let entity):
            
            break
        case .noResponse:
            break
        case .networkFailure(_):
            break
        case .errorResponse:
            break
        case .parsing(_):
            break
        }
    }*/
}

/*
extension NetworkError2 {
    var errorData: Data? {
        guard case let NetworkError2.error(statusCode: _, data: data) = self
               else {  return nil }
        return data
    }
    
    
    var hasDataError: Bool {
        
        switch self {
        case .error(_, _):
            return true
        case .notConnected:
            return false
        case .cancelled:
            return false
        case .generic(_):
            return false
        case .urlGeneration:
            return false
        case .errorDecode:
            return false
        }
    }
}
*/




