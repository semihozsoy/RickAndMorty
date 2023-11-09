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
            Text("Full Name: \(result.name ?? "")")
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
            Text("Location: \(result.location?.name ?? "")")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
            Text("Created: \(result.created?.toDate() ?? "")")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
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
