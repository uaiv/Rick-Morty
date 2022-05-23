//
//  CharacterModel.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 11/05/2022.
//

import Foundation

struct CharacterResponsObject: Codable {
    let info: infoModel
    let results: [ResultsModel]
}

struct infoModel: Codable {
    let next: String?
    let prev: String?
}

struct ResultsModel: Codable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: originModel
    let location: locationMode
    let image: String
}

struct originModel: Codable {
    let name: String
    let url: String
}

struct locationMode: Codable {
    let name: String
    let url: String
}


