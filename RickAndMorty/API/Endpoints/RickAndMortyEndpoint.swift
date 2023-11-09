//
//  RickAndMortyEndpoint.swift
//  RickAndMorty
//
//  Created by Semih Ozsoy on 6.11.2023.
//

import Foundation

enum RickAndMortyEndpoint {
    case character
}

extension RickAndMortyEndpoint: Endpoint {
    var method: RequestMethod {
        switch self {
        case .character:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .character:
            return ["Content-Type": "application/json;charset=utf-8"]
        }
    }
    
    var body: [String : String]? {
        return nil
    }
    
    var path: String {
        switch self {
        case .character:
            return "/api/character"
        }
    }
}

