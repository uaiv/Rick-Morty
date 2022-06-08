//
//  EpisodesModel.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 08/06/2022.
//

import Foundation

struct EpisodeResponseObject: Codable {
    let info: EpisodeInfoModel
    let results: [EpisodeResultsModel]
}

struct EpisodeInfoModel: Codable {
    let next: String?
    let prev: String?
}

struct EpisodeResultsModel: Codable {
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
}
