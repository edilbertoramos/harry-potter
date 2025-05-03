//
//  FeedServiceMock.swift
//  harry-potterTests
//
//  Created by Edilberto Ramos on 03/05/25.
//

import XCTest
@testable import harry_potter

class FeedServiceMock: FeedServiceProtocol {
    var shouldReturnError = false

    func characters() async throws -> ServiceResult<[HPCharacter]> {
        if shouldReturnError {
            return (Data(), .failure(.empty))
        } else {
            return (Data(), .success(mockData))
        }
    }
    
    func students() async throws -> ServiceResult<[HPCharacter]> {
        if shouldReturnError {
            return (Data(), .failure(.empty))
        } else {
            return (Data(), .success(mockData))
        }
    }
    
    func staff() async throws -> ServiceResult<[HPCharacter]> {
        if shouldReturnError {
            return (Data(), .failure(.empty))
        } else {
            return (Data(), .success(mockData))
        }
    }
  
    var mockData: [HPCharacter] {
        let harryWand = HPWand(wood: "holly",
                               core: "phoenix tail feather",
                               length: 11)
        
        let harry = HPCharacter(
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
            wand: harryWand,
            patronus: "stag",
            hogwartsStudent: true,
            hogwartsStaff: false,
            actor: "Daniel Radcliffe",
            alternateActors: [],
            alive: true,
            image: "https://ik.imagekit.io/hpapi/harry.jpg"
        )

        let hermioneWand = HPWand(wood: "vine",
                                  core: "dragon heartstring",
                                  length: 10.75)
        let hermione = HPCharacter(
            id: "4c7e6819-a91a-45b2-a454-f931e4a7cce3",
            name: "Hermione Granger",
            alternateNames: ["Hermy", "Know-it-all"],
            species: "human",
            gender: "female",
            house: "Gryffindor",
            dateOfBirth: "19-09-1979",
            yearOfBirth: 1979,
            wizard: true,
            ancestry: "muggleborn",
            eyeColour: "brown",
            hairColour: "brown",
            wand: hermioneWand,
            patronus: "otter",
            hogwartsStudent: true,
            hogwartsStaff: false,
            actor: "Emma Watson",
            alternateActors: [],
            alive: true,
            image: "https://ik.imagekit.io/hpapi/hermione.jpeg"
        )

        return [harry, hermione]
    }
    
}
