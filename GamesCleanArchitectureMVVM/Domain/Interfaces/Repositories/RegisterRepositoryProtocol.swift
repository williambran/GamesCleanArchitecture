//
//  RegisterRepositoryProtocol.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 13/04/22.
//

import Foundation





protocol RegisterRepositoryProtocol {
    
    typealias CompletionHandlerWithError<T,Y> = (Result<T, DataTranferErrorCustom<Y>>) -> Void
   // typealias ResultBlockWithError<T: Codable,Y: Codable> = ((_ response: ))
    
    func makeRegisterRequest(registerRequest: RegisterRequest,
                          completion: @escaping (Result<UserLogged, Error>)-> Void)
    
    
    func makeRegisterRequestWithResult(registerRequest: RegisterRequest , completion: @escaping (Result<UserLogged,Error>)->Void)
}
