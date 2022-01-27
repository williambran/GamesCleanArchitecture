//
//  JSONResponseDecoder.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 17/01/22.
//

import Foundation



class JSONResponseDecoder: ResponseDecoder {
    init(){}
    func decode<T>(_ data: Data) throws -> T where T : Decodable {
        let data = try JSONDecoder().decode(T.self, from: data)
        
        return data
    }
}
