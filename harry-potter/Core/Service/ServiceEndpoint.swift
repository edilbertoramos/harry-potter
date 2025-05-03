//
//  ServiceEndpoint.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 03/05/25.
//

import Foundation

public protocol ServiceEndpoint {
    
    var endpoint: String { get }
    
}

// MARK: - Default to String
extension ServiceEndpoint where Self: RawRepresentable, Self.RawValue == String {
    
    public var endpoint: String {
        return self.rawValue
    }
    
}
