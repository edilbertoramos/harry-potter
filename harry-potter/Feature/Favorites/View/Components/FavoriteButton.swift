//
//  FavoriteButton.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    @EnvironmentObject var userSettings: UserSettings
    let id: String

    var body: some View {
        Button(action: {
            withAnimation {
                favoritesManager.toggle(id)
            }
        }) {
            Image(systemName: favoritesManager.favorites.contains(id) ? "heart.fill" : "heart")
                .imageScale(.large)
                .foregroundColor(favoritesManager.favorites.contains(id) ? userSettings.preferredHouse.color : .gray)
        }
    }
}
