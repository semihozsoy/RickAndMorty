//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Semih Ozsoy on 6.11.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct RickAndMortyView: View {
    @StateObject var viewModel = RickAndMortyViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.results, id: \.id) { item in
                // NavigationLink wrapping our cell.
                NavigationLink {
                    RickAndMortyDetailView(result: item)
                } label: {
                    CharacterCell(result: item)
                }
            }.task {
                await viewModel.getCharacters()
             }
            .navigationTitle("Rick and Morty")
        }
    }
}

struct RickAndMortyView_Previews: PreviewProvider {
    static var previews: some View {
        RickAndMortyView()
            .preferredColorScheme(.light)
    }
}
