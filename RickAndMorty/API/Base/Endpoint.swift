//
//  Endpoint.swift
//  RickAndMorty
//
//  Created by Semih Ozsoy on 6.11.2023.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "rickandmortyapi.com"
    }
}
