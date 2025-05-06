//
//  FeedDetailView.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import SwiftUI

struct FeedDetailView: View {
    let character: HPCharacter

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if let imageUrl = character.image, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .scaledToFit()
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(character.name)
                        .font(.largeTitle)
                        .bold()

                    if let house = character.house {
                        Text("House: \(house)")
                    }
                    if let ancestry = character.ancestry {
                        Text("Ancestry: \(ancestry)")
                    }
                    if let dob = character.dateOfBirth {
                        Text("Date of Birth: \(dob)")
                    }
                    if let patronus = character.patronus {
                        Text("Patronus: \(patronus)")
                    }
                    if let wand = character.wand {
                        Text("Wand: \(wand.wood) & core: \(wand.core), length: \(wand.length)\"")
                    }
                    if let actor = character.actor {
                        Text("Actor: \(actor)")
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    FeedDetailView(character: HPCharacter.createMock())
}

