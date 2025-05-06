//
//  FeedView.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject private var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Filter", selection: $viewModel.selectedFilter) {
                    
                    ForEach(ItemType.allCases, id: \.self) { filter in
                        Text(filter.rawValue)
                            .tag(filter.tag)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                if viewModel.isLoading {
                    ProgressView()
                }
                
                List(viewModel.filteredCharacters) { character in
                    NavigationLink(destination: FeedDetailView(character: character)) {
                        FeedRowView(character: character)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Wizarding World")
        }
        .task {
            await viewModel.getAll()
        }
    }
    
}

#Preview {
    FeedView()
}
