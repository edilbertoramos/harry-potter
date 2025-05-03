//
//  ServiceHeaders.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 03/05/25.
//

import Foundation

struct ServiceHeaders {
    
    static var authenticatedHeaders: [String: String] {
        var headers = [String: String]()
        headers["content-type"] = "application/json"
        return headers
    }
    
}
