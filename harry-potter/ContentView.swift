//
//  ContentView.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 29/04/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSettings: UserSettings

    var body: some View {
        TabView {
            FeedView()
                .tabItem { Label("Explore", systemImage: "list.bullet") }
            
            FavoritesView()
                .tabItem { Label("Favorites", systemImage: "heart.fill") }
            
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
        .tint(userSettings.preferredHouse.tabColor)
    }
    
}

#Preview {
    ContentView()
}
