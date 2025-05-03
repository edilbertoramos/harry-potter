//
//  FeedService.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 03/05/25.
//

import Foundation

final class FeedService: FeedServiceProtocol {
    
    private enum EndPoint: String, ServiceEndpoint {
        case characters = "characters"
        case students = "characters/students"
        case staff = "characters/staff"
    }
    
    func characters() async throws -> ServiceResult<[HPCharacter]> {
        let url = try ServiceHelper.makeUrl(withEndPoint: EndPoint.characters)
        return try await ServiceHelper.get(
            url: url,
            headers: ServiceHeaders.authenticatedHeaders
        )
    }
    
    func students() async throws -> ServiceResult<[HPCharacter]> {
        let url = try ServiceHelper.makeUrl(withEndPoint: EndPoint.students)
        return try await ServiceHelper.get(
            url: url,
            headers: ServiceHeaders.authenticatedHeaders
        )
    }
    
    func staff() async throws -> ServiceResult<[HPCharacter]> {
        let url = try ServiceHelper.makeUrl(withEndPoint: EndPoint.staff)
        return try await ServiceHelper.get(
            url: url,
            headers: ServiceHeaders.authenticatedHeaders
        )
    }
    
}
