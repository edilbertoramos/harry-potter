//
//  HPCharacter.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 03/05/25.
//

import Foundation

// MARK: - Character
struct HPCharacter: Codable {
    let id: String
    let name: String
    let alternateNames: [String]
    let species: String
    let gender: String
    let house: String?
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool
    let ancestry: String?
    let eyeColour: String?
    let hairColour: String?
    let wand: HPWand
    let patronus: String?
    let hogwartsStudent: Bool
    let hogwartsStaff: Bool
    let actor: String?
    let alternateActors: [String]
    let alive: Bool
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case alternateNames = "alternate_names"
        case species
        case gender
        case house
        case dateOfBirth = "dateOfBirth"
        case yearOfBirth = "yearOfBirth"
        case wizard
        case ancestry
        case eyeColour = "eyeColour"
        case hairColour = "hairColour"
        case wand
        case patronus
        case hogwartsStudent = "hogwartsStudent"
        case hogwartsStaff = "hogwartsStaff"
        case actor
        case alternateActors = "alternate_actors"
        case alive
        case image
    }
}

// MARK: - Wand
struct HPWand: Codable {
    let wood: String?
    let core: String?
    let length: Double?

    enum CodingKeys: String, CodingKey {
        case wood
        case core
        case length
    }
}
