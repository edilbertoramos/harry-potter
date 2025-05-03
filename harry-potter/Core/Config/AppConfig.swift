//
//  AppConfig.xcconfig
//  harry-potter
//
//  Created by Edilberto Ramos on 03/05/25.
//

import Foundation

struct AppConfig {
    
    enum Parameter: String {
        case baseUrl = "BASE_URL"
        case connectionProtocol = "CONNECTION_PROTOCOL"
    }
    
    static var baseUrl: String {
        data(from: .baseUrl) ?? ""

    }
    
    static var connectionProtocol: String {
        data(from: .connectionProtocol) ?? ""
    }
    
    static func data(from parameter: Parameter) -> String? {
        return Bundle.main.object(forInfoDictionaryKey: parameter.rawValue) as? String
    }
    
}
