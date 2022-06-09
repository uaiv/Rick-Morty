//
//  CharactersModel.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 03/06/2022.
//

import Foundation

struct CharacterResponseObject: Codable {
    let info: CharacterInfoModel
    let results: [CharacterResultsModel]
}

struct CharacterInfoModel: Codable {
    let next: String?
    let prev: String?
}

struct CharacterResultsModel: Codable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: OriginModel
    let location: LocationMode
    let image: String
}

struct OriginModel: Codable {
    let name: String
    let url: String
}

struct LocationMode: Codable {
    let name: String
    let url: String
}


