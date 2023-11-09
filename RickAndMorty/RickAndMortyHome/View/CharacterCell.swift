//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Semih Ozsoy on 9.11.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterCell: View {
    var result: RickAndMortyResult
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: result.image ?? ""))
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(result.name ?? "")
                    .fontWeight(.semibold)
                Text("Status: \(result.status?.rawValue ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Gender: \(result.gender?.rawValue ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Species: \(result.species?.rawValue ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
}
