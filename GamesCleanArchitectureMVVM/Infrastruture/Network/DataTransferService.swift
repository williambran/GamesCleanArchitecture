//
//  DataTransferService.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import Foundation


  protocol DataTransferServiceProtocol {
    
    typealias CompletionHandler<T> = (Result<T, DataTranferError>) -> Void
    
    func request<T:Decodable, E: ResponseRequestable>(endpoint: E, completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where E.Response == T
}

public final class DataTransferService {
    
    var networkServices: NetworkServicesProtocol
    var errorLog: DataTransferErrorLogger
    var networkError: DataTransferError
    
    init(networkServices: NetworkServicesProtocol,
        errorLog:DataTransferErrorLogger = DataTransferErrorLog(),
         networkError: DataTransferError = DataTransferErrorResolver()
         
    ){
        self.errorLog = errorLog
        self.networkError = networkError
        self.networkServices = networkServices
    }
}


extension DataTransferService: DataTransferServiceProtocol{
     func request<T: Decodable, E: ResponseRequestable>(endpoint: E,
                                                       completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where E.Response == T {
        
        return self.networkServices.request(endPoint: endpoint) { result in
            switch result {
            case .success(let data):
                let result: Result<T, DataTranferError> = self.decoder(data: data, decoder: endpoint.responseDecoder)
                DispatchQueue.main.async { return completion(result) }
            case .failure( let error):
                self.errorLog.log(error: error)
                DispatchQueue.main.async { return completion(.failure(.networkFailure(error))) }
            }
        }
    }
    
    
    
    
   private func decoder<T: Decodable>(data: Data?, decoder: ResponseDecoder) -> Result<T, DataTranferError> {
       guard let data = data else {   return .failure(.noResponse)    }
       do{
           let result: T = try decoder.decode(data)
           return .success(result)
       } catch {
           print("💥algun error decoder")
           errorLog.log(error: error)
           return .failure(.parsing(error))
           
       }
    }

    

    
    
}

