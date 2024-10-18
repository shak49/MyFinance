//
//  NetworkClient.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/16/24.
//

import Foundation

final class NetworkClient {
    // MARK: - Properties
    static let shared = NetworkClient()
    
    // MARK: - Functions
    func request<RESP: Codable>(endpoint: Endpoint, type: RESP.Type) async throws -> RESP {
        guard let url = endpoint.url else { throw NetworkError.invalidURL }
        guard let request = self.buildRequest(from: url, method: endpoint.method) else {
            throw NetworkError.invalidRequest
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
            throw NetworkError.status(code: (response as! HTTPURLResponse).statusCode)
        }
        guard let result = try? JSONDecoder().decode(type, from: data) else {
            throw NetworkError.unableToDecode
        }
        return result
    }
    
    func request(endpoint: Endpoint) async throws {
        guard let url = endpoint.url else { throw NetworkError.invalidURL }
        guard let request = self.buildRequest(from: url, method: endpoint.method) else {
            throw NetworkError.invalidRequest
        }
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
            throw NetworkError.status(code: (response as! HTTPURLResponse).statusCode)
        }
    }
}

extension NetworkClient {
    fileprivate func buildRequest(from url: URL, method: Endpoint.MethodType) -> URLRequest? {
        var request = URLRequest(url: url)
        switch method {
        case .GET(let token):
            guard let token = token else { return nil }
            request.httpMethod = "GET"
            request.addValue(token, forHTTPHeaderField: "Authorization")
        case .POST(let data):
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
        }
        return request
    }
}
