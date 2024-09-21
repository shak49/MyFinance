//
//  NetworkClient.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/16/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case error(code: Int)
    case unableToDecode
    
    var description: String {
        switch self {
        case .invalidURL:
            return "This URL is not valid."
        case .error(let code):
            return "Error with status code: \(code)."
        case .unableToDecode:
            return "Unable to decode."
        }
    }
}

final class NetworkClient {
    // MARK: - Properties
    static let shared = NetworkClient()
    
    // MARK: - Functions
    func request<RESP: Codable>(endpoint: Endpoint, type: RESP.Type) async throws -> RESP {
        guard let url = endpoint.url else { throw NetworkError.invalidURL }
        let request = buildRequest(from: url, method: endpoint.method)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            let error = (response as! HTTPURLResponse).mimeType
            throw NetworkError.error(code: statusCode)
        }
        guard let result = try? JSONDecoder().decode(type, from: data) else {
            throw NetworkError.unableToDecode
        }
        return result
    }
    
    func request(endpoint: Endpoint) async throws {
        guard let url = endpoint.url else { throw NetworkError.invalidURL }
        let request = buildRequest(from: url, method: endpoint.method)
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkError.error(code: statusCode)
        }
    }
}

extension NetworkClient {
    fileprivate func buildRequest(from url: URL, method: Endpoint.MethodType) -> URLRequest {
        var request = URLRequest(url: url)
        switch method {
        case .GET:
            request.httpMethod = "GET"
        case .POST(let data):
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
        case .PUT(let data):
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
        }
        return request
    }
}
