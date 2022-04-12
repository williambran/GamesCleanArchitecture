//
//  GamesListDTO.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 11/04/22.
//

import Foundation





struct GamesListDTO: Decodable {
    
    
    let games: [GameDTO]
    
}



extension GamesListDTO {
    struct GameDTO: Decodable {
        
        let title: String
        let studio: String?
        let description: String?
        let tags: [String]?
        let videosUrls: VideosUrlsDTO?
        let galleryImages: [String]?
    }
}

struct VideosUrlsDTO: Decodable {
    let mobile: String?
    let tablet: String?
}




extension GamesListDTO{
    func toDomain() -> GameList {
        return .init(games: games.map{ $0.toDomain() } )
    }
}



extension GamesListDTO.GameDTO {
    func toDomain()-> Game{
        return .init(title: title,
                     studio: studio,
                     description: description,
                     tags: tags,
                     videosUrls: videosUrls?.toDomain(),
                     galleryImages: galleryImages)
    }
}



extension VideosUrlsDTO {
    func toDomain()-> videosUrls{
        return .init(mobile: mobile,
                     tablet: tablet)
    }
}

