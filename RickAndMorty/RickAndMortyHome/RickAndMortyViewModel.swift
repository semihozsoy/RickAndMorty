//
//  RickAndMortyViewModel.swift
//  RickAndMorty
//
//  Created by Semih Ozsoy on 7.11.2023.
//

import Foundation


extension RickAndMortyView {
    @MainActor final class RickAndMortyViewModel: ObservableObject, HTTPClient {
        @Published var results: [RickAndMortyResult] = []
        
      func getCharacters() async {
            let result = await sendRequest(endpoint: RickAndMortyEndpoint.character, responseModel: RickAndMorty.self)
            switch result {
            case let .success(response):
                results = response.results ?? []
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
