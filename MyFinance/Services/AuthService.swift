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
    func signUp(user: AuthRequest?) async -> Result<AuthResponse?, Error>? {
        guard let user = user else { return nil }
        do {
            let data = try JSONEncoder().encode(user)
            let response = try await self.client.request(endpoint: .signUp(data: data), type: AuthResponse.self)
            return .success(response)
        } catch let error {
            return .failure(error)
        }
    }
    
}
