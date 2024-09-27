//
//  ProfileService.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/25/24.
//

import Foundation

final class ProfileService {
    // MARK: - Properties
    private let client = NetworkClient.shared
    
    // MARK: - Lifecycles
    
    // MARK: - Functions
    func currentUser(token: String) async -> UserProfile? {
        do {
            let user = try await self.client.request(endpoint: .currentUser(token: token), type: UserProfile.self)
            return user
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
        return nil
    }
}
