//
//  ItemType.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import Foundation

enum ItemType: String, CaseIterable, Identifiable {
    case all = "Characters"
    case students = "Students"
    case staff = "Staff"
    
    var id: String { self.rawValue }
    
    var tag: Int {
        switch self {
        case .all:
            0
        case .students:
            1
        case .staff:
            2
        }
    }
}
