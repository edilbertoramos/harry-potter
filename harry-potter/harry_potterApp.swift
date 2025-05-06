//
//  harry_potterApp.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 29/04/25.
//

import SwiftUI

@main
struct harry_potterApp: App {
    @StateObject private var viewModel = FeedViewModel()
    @StateObject private var favoritesManager = FavoritesManager()
    @StateObject private var userSettings = UserSettings()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(favoritesManager)
                .environmentObject(userSettings)
        }
    }
}
