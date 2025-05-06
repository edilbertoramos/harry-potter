//
//  FeedView.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import SwiftUI

struct FeedView: View {
    
    @EnvironmentObject var viewModel: FeedViewModel
    @EnvironmentObject var favoritesManager: FavoritesManager
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Filter", selection: $viewModel.selectedFilter) {
                    ForEach(CharacterType.allCases, id: \.self) { filter in
                        Text(filter.rawValue)
                            .tag(filter.tag)
                    }
                }
                .pickerStyle(.segmented)
                .padding([.top, .horizontal])
                
                if viewModel.isLoading {
                    ProgressView()
                }
                
                List(viewModel.filteredCharacters) { character in
                    NavigationLink(destination: FeedDetailView(character: character)) {
                        CharacterRowView(character: character)
                    }
                }
                .listStyle(.plain)
                .padding([.top])
            }
            .navigationTitle("Wizarding World")
            .background(userSettings.preferredHouse.backgroundColor)
        }
        .task {
            await viewModel.getAll()
        }
    }
    
}

#Preview {
    FeedView()
}
