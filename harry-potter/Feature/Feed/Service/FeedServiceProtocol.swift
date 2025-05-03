//
//  FeedServiceProtocol.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 03/05/25.
//

import Foundation

protocol FeedServiceProtocol {
    
    func characters() async throws -> ServiceResult<[HPCharacter]>

    func students() async throws -> ServiceResult<[HPCharacter]>

    func staff() async throws -> ServiceResult<[HPCharacter]>

}
