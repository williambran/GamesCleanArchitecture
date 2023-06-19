//
//  DataTransferService.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import Foundation


  protocol DataTransferServiceProtocol {
    
    typealias CompletionHandler<T> = (Result<T, DataTranferError>) -> Void
    typealias CompletionHandlerWithError<T,Y> = (Result<T, DataTranferErrorCustom<Y>>) -> Void
    
    func request<T:Decodable, E: ResponseRequestable>(endpoint: E, completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where E.Response == T
      
      
    func requestWithCustomResult<T: Decodable,Y: Decodable, E: ResponseRequestable>(endpoint: E,
                                                                       completion: @escaping  CompletionHandlerWithError<T,Y>) -> NetworkCancellable? where E.Response == T, E.ResponseError == Y
}

public final class DataTransferService {
    
    var networkServices: NetworkServicesProtocol
    var errorLog: DataTransferErrorLogger
    var dataTransferError: DataTransferError
    
    init(networkServices: NetworkServicesProtocol,
        errorLog:DataTransferErrorLogger = DataTransferErrorLog(),
         dataTransferError: DataTransferError = DataTransferErrorResolver()
         
    ){
        self.errorLog = errorLog
        self.networkServices = networkServices
        self.dataTransferError = dataTransferError
    }
}


extension DataTransferService: DataTransferServiceProtocol{

    
     func request<T: Decodable, E: ResponseRequestable>(endpoint: E,
                                                       completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where E.Response == T  {
        
        return self.networkServices.request(endPoint: endpoint) { result in
            switch result {
            case .success(let data):
                let result: Result<T, DataTranferError> = self.decoder(data: data, decoder: endpoint.responseDecoder)
                DispatchQueue.main.async { return completion(result) }
            case .failure( let error):
                self.errorLog.log(error: error)
                //let error = self.resolve(networkError: error)
                //DispatchQueue.main.async { return completion(.failure(error) )}
            }
        }
    }
    
    
    func requestWithCustomResult<T: Decodable,Y: Decodable, E: ResponseRequestable>(endpoint: E,
                                                                     completion: @escaping CompletionHandlerWithError<T,Y>) -> NetworkCancellable? where E.Response == T, E.ResponseError == Y  {
       
       return self.networkServices.request(endPoint: endpoint) { result in
           switch result {
           case .success(let data):
               let result: Result<T, DataTranferErrorCustom<Y>> = self.decoderCustomError(data: data, decoder: endpoint.responseDecoder)
               DispatchQueue.main.async { return completion(result) }
           case .failure( let error):
               self.errorLog.log(error: error)
               let error: Result<T, DataTranferErrorCustom<Y>> = self.resolve(networkError: error, errorDecode: endpoint.responseDecoder)
               DispatchQueue.main.async { return completion(error)}
           }
       }
   }
    
   private func decoder<T: Decodable>(data: Data?, decoder: ResponseDecoder) -> Result<T, DataTranferError> {
       guard let data = data else {   return .failure(.noResponse)    }
       do{
           let result: T = try decoder.decode(data)
           return .success(result)
       } catch {
           errorLog.log(error: error)
           return .failure(.parsing(error))
           
       }
    }
    
    
    private func decoderCustomError<T: Decodable, Y:Decodable>(data: Data?, decoder: ResponseDecoder) -> Result<T, DataTranferErrorCustom<Y>> {
        guard let data = data else {   return .failure(.noResponse)    }
        do{
            let result: T = try decoder.decode(data)
            return .success(result)
        } catch {
            errorLog.log(error: error)
            return .failure(.parsing(error))
            
        }
     }


    
    private func resolve<T: Decodable,Y: Decodable>(networkError: NetworkError, errorDecode: ResponseDecoder )->  Result<T, DataTranferErrorCustom<Y>>{
        guard let data = networkError.errorData else { return .failure(.networkFailure(networkError)) }
        if networkError.hasDataError {
            //try decode error data
            do{
                let result: Y = try errorDecode.decode(data)
                
                return .failure(.errorResult(entity: result))
            }catch{
                return .failure(.parsing(error))
            }
            
        }
        
        return .failure(.networkFailure(networkError))
    }
    

    
    
}

