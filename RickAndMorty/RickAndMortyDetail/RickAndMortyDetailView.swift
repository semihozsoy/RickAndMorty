//
//  RickAndMortyDetailView.swift
//  RickAndMorty
//
//  Created by Semih Ozsoy on 7.11.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct RickAndMortyDetailView: View {
    var result: RickAndMortyResult
    var body: some View {
        VStack(spacing: 20) {
            WebImage(url: URL(string: result.image ?? ""))
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12.0).stroke(lineWidth: 2))
                .shadow(radius: 5)
            ZStack {
                Text(result.name ?? "")
                    .font(.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
            }
            ZStack {
                Text("Location: \(result.location?.name ?? "unknown")")
                    .font(.headline)
                    .padding(5)
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .background(Color.white.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            ZStack {
                Text("Created: \(result.created?.toDate() ?? "")")
                    .font(.headline)
                    .padding(5)
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .background(Color.white.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
            }
        }
        .background(Image("DetailBackground"))
    }
}

struct RickAndMortyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RickAndMortyDetailView(result: .init(id: 1, name: "Rick Sanchez", status: .alive, species: .human, type: "", gender: .male, origin: .none, location: .none, image: "", episode: [""], url: "", created: ""))
    }
}

extension String {
    func toDate() -> String? {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        // 2017-11-04T18:48:46.250Z
        if let date = dateFormatter.date(from: self) {
            let newFormat = DateFormatter()
            newFormat.dateFormat = "dd/MM/yyyy"
            let formattedDate = newFormat.string(from: date)
            return formattedDate
        }
        return "problem occured"
    }
}
