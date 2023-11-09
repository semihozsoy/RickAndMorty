//
//  RequestError.swift
//  RickAndMorty
//
//  Created by Semih Ozsoy on 6.11.2023.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
}


