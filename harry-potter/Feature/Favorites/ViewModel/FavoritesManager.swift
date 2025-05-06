//
//  FavoritesManager.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import Foundation

class FavoritesManager: ObservableObject {
    @Published private(set) var favorites: Set<String> = []
    private let key = "favorites_ids"

    init() {
        load()
    }

    func toggle(_ id: String) {
        if favorites.contains(id) { favorites.remove(id) }
        else { favorites.insert(id) }
        save()
    }

    private func load() {
        if let saved = UserDefaults.standard.stringArray(forKey: key) {
            favorites = Set(saved)
        }
    }

    private func save() {
        UserDefaults.standard.set(Array(favorites), forKey: key)
    }
}
