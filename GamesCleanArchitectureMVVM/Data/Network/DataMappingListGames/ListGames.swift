//
//  ListGames.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 27/01/22.
//

import Foundation



struct ListGamesResponseDTO: Decodable {
    let title: String
    let studio: String
    let publicationYear: String
    let description: String
    let galleryImages : [String]
    let videosUrls: FormateResponseDTO
    let platforms: [String]
    let tags: [String]
}



struct FormateResponseDTO: Decodable{
    let mobile: String
    let yablet : String
}
