//
//  DataTranferErrorResolver.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 17/01/22.
//

import Foundation



protocol DataTransferError {
    func resolver(error: NetworkError)->Error
}

class DataTransferErrorResolver: DataTransferError{
    init() {}
    
    func resolver(error : NetworkError)-> Error{
        
        return error
    }
}




public protocol DataTransferErrorLogger {
    func log(error: Error)
}

public final class DataTransferErrorLog: DataTransferErrorLogger {
    init(){}
    
    public func log(error: Error){
        print("------")
        print("Error: \(error)")
    }
    
}
