//
//  AuthService.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/16/24.
//

import Foundation

final class AuthService {
    // MARK: - Properties
    private let client = NetworkClient.shared
    
    // MARK: - Lifecycles
    
    // MARK: - Functions
    func signIn(request: SignInRequest?) async -> Result<SignInResponse?, Error>? {
        guard let request = request else { return nil }
        do {
            let data = try JSONEncoder().encode(request)
            let response = try await self.client.request(endpoint: .signIn(data: data), type: SignInResponse.self)
            return .success(response)
        } catch let error {
            return .failure(error)
        }
    }
    
    func signUp(request: SignUpRequest?) async -> Result<SignUpResponse?, Error>? {
        guard let request = request else { return nil }
        do {
            let data = try JSONEncoder().encode(request)
            let response = try await self.client.request(endpoint: .signUp(data: data), type: SignUpResponse.self)
            return .success(response)
        } catch let error {
            return .failure(error)
        }
    }
    
}
