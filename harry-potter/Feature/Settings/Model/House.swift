//
//  House.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import SwiftUI

enum House: String, CaseIterable, Identifiable {
    case gryffindor = "Gryffindor"
    case slytherin = "Slytherin"
    case hufflepuff = "Hufflepuff"
    case ravenclaw = "Ravenclaw"
    case none = "None"

    var id: String { rawValue }
    var color: Color {
        switch self {
        case .gryffindor: return Color.red.opacity(0.8)
        case .slytherin:  return Color.green.opacity(0.8)
        case .hufflepuff: return Color.yellow.opacity(0.8)
        case .ravenclaw:  return Color.blue.opacity(0.8)
        case .none:       return Color.gray.opacity(0.3)
        }
    }
    
    var backgroundColor: Color {
        color.opacity(0.7)
    }
    
    var tabColor: Color {
        switch self {
        case .none: return Color.black
        default:    return color
        }
    }
}
