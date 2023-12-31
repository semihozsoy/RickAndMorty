//
//  RickAndMortyModel.swift
//  RickAndMorty
//
//  Created by Semih Ozsoy on 7.11.2023.
//

import Foundation

// MARK: - RickAndMorty
struct RickAndMorty: Codable {
    let info: Info?
    let results: [RickAndMortyResult]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - RickAndMortyResult
struct RickAndMortyResult: Codable, Hashable {
    
    func hash(into hasher: inout Hasher) {
         hasher.combine(id)
     }
    
    static func == (lhs: RickAndMortyResult, rhs: RickAndMortyResult) -> Bool {
       return lhs.id == rhs.id
    }
    
    let id: Int?
    let name: String?
    let status: Status?
    let species: Species?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
