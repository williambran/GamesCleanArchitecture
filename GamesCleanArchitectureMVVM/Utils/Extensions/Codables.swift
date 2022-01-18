//
//  Codables.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 17/01/22.
//

import Foundation




 extension Encodable {
    func toDictionary() throws -> [String: Any]? {
        let data = try JSONEncoder().encode(self)
        let jsonData = try JSONSerialization.jsonObject(with: data)
        return jsonData as? [String : Any]
    }
     
     func toJSONData()-> Data? {
         let data = try? JSONEncoder().encode(self)
         return  data
     }
     

}


extension URLSessionTask: NetworkCancellable { }

