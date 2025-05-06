//
//  FavoritesView.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: FeedViewModel
    @EnvironmentObject var favoritesManager: FavoritesManager
    @EnvironmentObject var userSettings: UserSettings

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.allResults.filter { favoritesManager.favorites.contains($0.id) }) { character in
                    NavigationLink(destination: FeedDetailView(character: character)) {
                        CharacterRowView(character: character)
                    }
                }
                .padding([.top])
            }
            .navigationTitle("Favorites")
            .background(userSettings.preferredHouse.backgroundColor)
            .overlay(
                Group {
                    if viewModel.allResults.filter({ favoritesManager.favorites.contains($0.id) }).isEmpty {
                        Text("No favorites yet.")
                            .foregroundColor(.secondary)
                            .italic()
                    }
                }
            )
        }
    }
}
