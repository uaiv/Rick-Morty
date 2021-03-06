//
//  LocationsModel.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 03/06/2022.
//

import Foundation

struct LocationResponseObject: Codable {
    let info: LocationInfoModel
    let results: [LocationResultsModel]
}

struct LocationInfoModel: Codable {
    let next: String?
    let prev: String?
}

struct LocationResultsModel: Codable {
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
}
