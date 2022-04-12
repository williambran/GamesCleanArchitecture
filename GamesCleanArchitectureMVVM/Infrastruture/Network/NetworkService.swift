//
//  NetworkService.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import Foundation

protocol NetworkServicesProtocol{
    
    typealias CompletionHandler = (Result<Data?,NetworkError>) -> Void
    
    func request(endPoint: Requestable, completion: @escaping CompletionHandler) -> NetworkCancellable?
}

public protocol NetworkCancellable {
    func cancel()
}

extension URLSessionTask: NetworkCancellable {
}

public protocol NetworkManagerProtocol{
    
    typealias CompletionHandler = (Data?, URLResponse?, Error?)->Void
    
    func request(urlRequest: URLRequest, completion: @escaping CompletionHandler) -> NetworkCancellable
}


 protocol NetworkLoggerProtocol {
    func log(request: URLRequest)
    func log(responseData data: Data?, response: HTTPURLResponse?)
    func log(error: Error)
}


class NetworkServices {
    
    var networkConfig: NetworkConfig
    var networkManager: NetworkManagerProtocol
    var networkLog: NetworkLoggerProtocol
    
    init(networkConfig: NetworkConfig,
         networkManager: NetworkManagerProtocol = NetworkManager(),
         networkLog: NetworkLoggerProtocol = NetworkLog()
    ){
        self.networkConfig = networkConfig
        self.networkManager = networkManager
        self.networkLog = networkLog
    }
    
    
    func request(urlRequest: URLRequest, completion: @escaping CompletionHandler) -> NetworkCancellable {
       
        networkManager.request(urlRequest: urlRequest) { data, response, requestError in
            let response = response as? HTTPURLResponse
            if let requestError = requestError {
                var error: NetworkError
                if (response != nil) {
                    error = .error(statusCode: response!.statusCode, data: data)
                }else{
                   error = self.searchError(error: requestError)
                }
                self.networkLog.log(error: error)
                completion(.failure(error))
            } else {
                self.networkLog.log(responseData: data, response: response)
                print("Respuesta, \(response!.statusCode)")
                completion(.success(data))
            }
            self.networkLog.log(request: urlRequest)
        }
    }
    
    func searchError(error : Error)->NetworkError{
        let code = URLError.Code(rawValue: (error as NSError).code)
        switch code {
        case .notConnectedToInternet :
            return .notConnected
        case .cancelled:
            return .cancelled
        default:
            return .generic(error)
        }
    }
}

extension NetworkServices: NetworkServicesProtocol {
    
    func request(endPoint: Requestable, completion: @escaping CompletionHandler) -> NetworkCancellable? {
        do{
            let urlRequest = try endPoint.urlRequest(networkConfig: networkConfig)
           return self.request(urlRequest: urlRequest, completion: completion)
        }catch{
            completion(.failure(.urlGeneration))
            return nil
        }
        
    }
    
    
}


//MARK: MANEJADOR DE RED (URLResquest-Alamofile)
public class NetworkManager: NetworkManagerProtocol  {
    init(){}
    public func request( urlRequest: URLRequest, completion: @escaping CompletionHandler) -> NetworkCancellable {
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: completion)
        task.resume()
        return task
    }
    
    
}



// MARK: LOG ERROR
public class NetworkLog: NetworkLoggerProtocol {
    func log(request: URLRequest) {
        let header = request.allHTTPHeaderFields!
        let url = request.url!
        let metodo = request.httpMethod!
        print("🙂 Headers: \(header) \n Url: \(url) \n Metodo: \(metodo) \n")
        
        if let bodyRequest = request.httpBody, let requestBodyToDict = try? JSONSerialization.jsonObject(with: bodyRequest, options: []) as? [String : AnyObject] {
            print("Body: \(requestBodyToDict)")
        }
        
    }
    
    func log(responseData data: Data?, response: HTTPURLResponse?) {
        
        if let responseData = data , let responseToDict = try? JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] {
            print("RESPONSE 🥸: \(responseToDict) \n HTTPResponse: \(response!.statusCode)")
        }
      
    }
    
    func log(error: Error) {
        print("🤯 Error: \(error)")
    }
    
    
}
