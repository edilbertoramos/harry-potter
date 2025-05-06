//
//  CharacterRowView.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import SwiftUI

struct CharacterRowView: View {
    let character: HPCharacter

    var body: some View {
        HStack(spacing: 12) {
            if let imageUrl = character.image, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            } else {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 50, height: 50)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(character.name)
                    .font(.headline)
                if let house = character.house {
                    Text(house)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            FavoriteButton(id: character.id)
                .buttonStyle(.plain)
        }
        .padding(.vertical, 4)
    }
    
}

#Preview {
    CharacterRowView(character: HPCharacter.createMock())
}

