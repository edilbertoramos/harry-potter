//
//  ServiceHelper.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 03/05/25.
//

import Foundation

public struct ServiceHelper {

    private init() {}
    
}

// MARK: - Make URL
public extension ServiceHelper {
    
    static func makeUrl(withEndPoint service: ServiceEndpoint) throws -> String {
        return String(
            format: "%@://%@/%@",
            arguments: [
                AppConfig.connectionProtocol,
                AppConfig.baseUrl,
                service.endpoint
            ]
        )
    }

}

// MARK: - Requests
public extension ServiceHelper {

    static func get<T: Codable>(url: String, parameters: [String: Any]? = nil, headers: [String: String]? = nil) async throws -> ServiceResult<T> {
        let url = addParams(parameters, onUrl: url)
        let request = try makeRequest(url: url, method: .get, headers: headers)
        
        return try await withUnsafeThrowingContinuation { continuation in
            let urlSessionTask = URLSession
                .shared
                .dataTask(with: request) { data, response, error in
                    Task {
                        if let error = error {
                            continuation.resume(throwing: error)
                        } else if let data = data,
                                  let response = response as? HTTPURLResponse {
                            printResponse(method: .get, response: response, data: data)
                            switch validate(data: data, response: response) {
                            case .success(let data):
                                continuation.resume(returning: try await decodingData(data))
                            case .failure(let error):
                                continuation.resume(returning: (data, .failure(error)))
                            }
                        }
                    }
                }
            urlSessionTask.resume()
        }
    }

}

// MARK: - Helper
private extension ServiceHelper {
    
    static func makeRequest(url: String, method: ServiceMethod, headers: [String: String]? = nil) throws -> URLRequest {
        #if DEBUG
        print("[REQUEST URL] \(url)")
        #endif
        
        guard let url = URL(string: url) else {
            throw ServiceError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        return request
    }
    
    static func addParams(_ params: [String: Any]?, onUrl url: String) -> String {
        guard let params = params else {
            return url
        }
        
        let queryItems = params.map {
            URLQueryItem(name: $0.key, value: "\($0.value)")
        }
        
        var components = URLComponents(string: url)
        components?.queryItems = queryItems
        
        return components?.url?.absoluteString ?? ""
    }
    
    static func validate<T>(data: T, response: HTTPURLResponse) -> Result<T, ServiceError> {
        switch response.statusCode {
        case 200, 201, 203, 204:
            return .success(data)
        case 400:
            return .failure(.badRequest)
        case 404:
            return .failure(.unauthorized)
        case 500:
            return .failure(.internalServerError)
        default:
            let errorMessage = String(
                format: "[Error] API response error - STATUS CODE [%@]",
                arguments: [response.statusCode]
            )
            return .failure(.custom(errorMessage))
        }
    }
    
    static func decodingData<T: Codable>(_ data: Data) async throws -> ServiceResult<T> {
        return try await withUnsafeThrowingContinuation { continuation in
            do {
                let decoder = JSONDecoder()
                let decodableData = try decoder.decode(T.self, from: data)
                continuation.resume(returning: (data, .success(decodableData)))
            } catch {
                continuation.resume(returning: (data, .failure(.undecodable)))
            }
        }
    }
    
    
}

// MARK: - LOG
private extension ServiceHelper {

    static func printResponse(method: ServiceMethod, response: HTTPURLResponse?, data: Data?) {
        #if DEBUG
        print("💚 RESPONSE OF:")
        print("\(method.rawValue): \(response?.url?.absoluteString ?? "")")
        print("STATUS CODE: [\(response?.statusCode ?? 0)]")
        printJson(jsonObject(data))
        #endif
    }
    
    static func printJson(_ data: Any?) {
        guard let jsonString = getJSONString(data) else { return }
        print(jsonString)
    }
    
    static func getJSONString(_ json: Any?) -> String? {
        if let json = json as? [String: Any],
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
           let jsonText = String(data: jsonData, encoding: .utf8) {
            return jsonText
        }
        else if let json = json as? [[String: Any]],
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
           let jsonText = String(data: jsonData, encoding: .utf8) {
              return jsonText
        }
        return nil
    }
    
    static func jsonObject(_ data: Data?) -> Any? {
        guard let data else { return nil }
        do {
            return try JSONSerialization.jsonObject(with: data, options: [])
        } catch {
            return nil
        }
    }
    
}
