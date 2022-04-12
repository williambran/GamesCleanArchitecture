//
//  GameListRequest.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 11/04/22.
//

import Foundation





struct GameList: Equatable {
    
    let games: [Game]
}

struct Game: Equatable,Identifiable {

    let title: String
    //typealias Identifier =  String
    let id = UUID()
    let studio: String?
    let description: String?
    let tags: [String]?
    let videosUrls: videosUrls?
    let galleryImages: [String]?
}


struct videosUrls:Equatable {
    let mobile: String?
    let tablet: String?
}

