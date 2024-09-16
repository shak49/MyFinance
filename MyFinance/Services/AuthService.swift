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
    func signUp(user: UserRequest?) async -> UserResponse? {
        guard let user = user else { return nil }
        do {
            let data = try JSONEncoder().encode(user)
            let response = try await self.client.request(endpoint: .signUp(data: data), type: UserResponse.self)
            return response
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return nil
    }
    
}
