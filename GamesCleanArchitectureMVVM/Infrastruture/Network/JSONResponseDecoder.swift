//
//  JSONResponseDecoder.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 17/01/22.
//

import Foundation



class JSONResponseDecoder: ResponseDecoder {
    init(){}
    func decode<T: Decodable>(_ data: Data) throws -> T  {
        let data = try JSONDecoder().decode(T.self, from: data)
        
        return data
    }
}
