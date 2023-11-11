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
    @State var showDetailView = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundStyle(.white)
                .opacity(0.8)
                .overlay(RoundedRectangle(cornerRadius: 15.0).stroke(lineWidth: 2))
                HStack {
                    WebImage(url: URL(string: result.image ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                        .padding(.leading)
                        .shadow(radius: 5)
                    
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(result.name ?? "")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("Status: \(result.status?.rawValue ?? "")")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Text("Gender: \(result.gender?.rawValue ?? "")")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Text("Species: \(result.species?.rawValue ?? "")")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .padding(.trailing)
                }
                .frame(height: 115)
                
        }
        .padding(.horizontal,10)
        .shadow(radius: 10)
        .onTapGesture {
            showDetailView.toggle()
        }
        .sheet(isPresented: $showDetailView, content: {
            RickAndMortyDetailView(result: result)
        })
    }
    
}

