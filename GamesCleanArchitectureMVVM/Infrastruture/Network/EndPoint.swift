//
//  EndPoint.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import Foundation


protocol Requestable{
    var path: String { get }
    var isFullPath: Bool { get }
    var method:RequestMethodTypes { get }
    var headerParameters: [String: String] { get }
    var bodyParametersEncodable: Encodable? { get }
    var queryParameters: [String: Any] {get}
    var bodyParameters: [String: Any] { get }
    var bodyEncoding: BodyEncoding { get }
    func urlRequest(networkConfig: NetworkConfig) throws -> URLRequest
}

 protocol ResponseDecoder {
    func decode<T: Decodable>(_ data: Data) throws -> T
}

protocol ResponseRequestable:Requestable {
    associatedtype Response
    var responseDecoder:ResponseDecoder { get }
}

public class EndPoint<R> : ResponseRequestable {
    
    var responseDecoder: ResponseDecoder
    
    typealias Response = R
    
    var path: String
    var isFullPath: Bool
    var method: RequestMethodTypes
    var headerParameters: [String : String]
    var bodyParametersEncodable: Encodable?
    var queryParameters: [String : Any]
    var bodyParameters: [String : Any]
    var bodyEncoding: BodyEncoding

    
    init(path: String,
         isFullPath: Bool = false,
         method: RequestMethodTypes,
         headerParameters: [String : String] = [:],
         bodyParametersEncodable:Encodable? = nil,
         queryParameters:[String : Any] = [:],
         bodyParameters: [String : Any] = [:],
         bodyEncoding: BodyEncoding = .jsonSerializationData,
         responseDecoder: ResponseDecoder = JSONResponseDecoder()){
        
        self.path = path
        self.isFullPath = isFullPath
        self.method = method
        self.headerParameters = headerParameters
        self.bodyParametersEncodable = bodyParametersEncodable
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
        self.bodyEncoding = bodyEncoding
        self.responseDecoder = responseDecoder
    }
    
    
}


extension Requestable {
 //overrider Func of protocol
    func urlRequest(networkConfig: NetworkConfig) throws -> URLRequest {
        
        let url = try self.url(networkConfig: networkConfig)
        var urlRequest = URLRequest(url: url)
        var headerConfig: [String:String] = networkConfig.headers
        
        self.headerParameters.forEach { headerConfig.updateValue($0.value, forKey: $0.key) }
        let parameterBody = self.bodyParameters
        if !parameterBody.isEmpty {
            urlRequest.httpBody = encodeBody(bodyParameter: parameterBody, bodyEncoding: .jsonSerializationData)
        }
        
        urlRequest.httpMethod = method.value  //probable error
        urlRequest.allHTTPHeaderFields = headerConfig
        
        return urlRequest
        
    }
    
    //Get Url
    func url(networkConfig: NetworkConfig ) throws -> URL {
        let baseURL = networkConfig.baseURL.absoluteString.last != "/" ? networkConfig.baseURL.absoluteString + "/" : networkConfig.baseURL.absoluteString
        let endPoint = isFullPath ? path : baseURL.appending(baseURL)
        
        //Here Add URLComponent
        guard var urlComponents = URLComponents(string: endPoint) else { throw RequestGenerationError.components }
        var urlQueryItems = [URLQueryItem]()
        let queryParameters = self.queryParameters
        
        queryParameters.forEach { (key: String, value: Any) in
            urlQueryItems.append(URLQueryItem(name: key, value: "\(value)"))
        }
        
        networkConfig.queryParameters.forEach {
            urlQueryItems.append(URLQueryItem(name: $0.key, value: $0.value))
        }
        
        urlComponents.queryItems = urlQueryItems.isEmpty ?  urlQueryItems :  nil
        guard let url = urlComponents.url else {throw RequestGenerationError.components }
        
        return url
        
        
    }
    
    
    func encodeBody(bodyParameter: [String: Any], bodyEncoding: BodyEncoding ) -> Data?{
        switch bodyEncoding {
            
        case .jsonSerializationData:
            return try? JSONSerialization.data(withJSONObject: bodyParameter) //probar con codable
            
        case .stringEncodingAscii:
            return  bodyParameter.queryString.data(using: String.Encoding.ascii, allowLossyConversion: true)
            
        }
    }
    
}
