//
//  HPCharacter.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 03/05/25.
//

import Foundation

// MARK: - Character
struct HPCharacter: Codable, Identifiable {
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
    let wand: HPWand?
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


// MARK: - Mock
extension HPCharacter {
    
    static func createMock() -> HPCharacter {
        HPCharacter(
            id: "9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8",
            name: "Harry Potter",
            alternateNames: ["The Boy Who Lived", "The Chosen One", "Undesirable No. 1"],
            species: "human",
            gender: "male",
            house: "Gryffindor",
            dateOfBirth: "31-07-1980",
            yearOfBirth: 1980,
            wizard: true,
            ancestry: "half-blood",
            eyeColour: "green",
            hairColour: "black",
            wand: HPWand(wood: "holly", core: "phoenix tail feather", length: 11),
            patronus: "stag",
            hogwartsStudent: true,
            hogwartsStaff: false,
            actor: "Daniel Radcliffe",
            alternateActors: [],
            alive: true,
            image: "https://ik.imagekit.io/hpapi/harry.jpg"
        )
    }
    
}
