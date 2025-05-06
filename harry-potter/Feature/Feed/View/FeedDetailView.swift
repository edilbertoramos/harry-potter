//
//  FeedDetailView.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import SwiftUI

struct FeedDetailView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    let character: HPCharacter

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Banner
                ZStack(alignment: .bottomLeading) {
                    if let urlString = character.image, let url = URL(string: urlString) {
                        AsyncImage(url: url) { img in
                            img.resizable().scaledToFill()
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                    } else {
                        Color.gray.opacity(0.3)
                    }
                }
                .frame(height: 300)
                .clipped()
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black.opacity(0.7)]),
                        startPoint: .center, endPoint: .bottom
                    )
                )

                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text(character.name)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.primary)
                        Spacer()
                        FavoriteButton(id: character.id)
                            .environmentObject(favoritesManager)
                    }

                    if let house = character.house, !house.isEmpty {
                        Text(house)
                            .font(.headline)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(House(rawValue: house)?.color ?? .gray)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                    }

                    Divider()

                    Group {
                        InfoRow(title: "Ancestry", value: character.ancestry)
                        InfoRow(title: "DOB", value: character.dateOfBirth)
                        InfoRow(title: "Patronus", value: character.patronus)
                        if let wand = character.wand,
                           let wood = wand.wood,
                           let core = wand.core,
                           let length = wand.length {
                            InfoRow(
                                title: "Wand",
                                value: "\(wood), \(core), \(length)''"
                            )
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InfoRow: View {
    let title: String
    let value: String?

    var body: some View {
        HStack {
            Text("\(title):")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Spacer()
            let value = value?.isEmpty == true ? "-" : value
            Text(value ?? "-")
                .font(.body)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    FeedDetailView(character: HPCharacter.createMock())
}

