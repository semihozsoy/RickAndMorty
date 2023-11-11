//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Semih Ozsoy on 6.11.2023.
//

import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct RickAndMortyView: View {
    @StateObject var viewModel = RickAndMortyViewModel()
    
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    ForEach(viewModel.results, id: \.id) { item in
                        CharacterCell(result: item)
                    }.task {
                    await viewModel.getCharacters()
                    }
                    .padding(.top)
                }
                
            }.background(Image("MainBackground"))
            .navigationTitle("Rick and Morty")
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct RickAndMortyView_Previews: PreviewProvider {
    static var previews: some View {
        RickAndMortyView().preferredColorScheme(.dark)
    }
}

