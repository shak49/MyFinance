//
//  AccountService.swift
//  MyFinance
//
//  Created by Shak Feizi on 2/1/25.
//

import Foundation

class AccountService {
    typealias PlaidTokenResult = Result<PlaidTokenResponse?, NetworkError>?
    // MARK: - Properties
    private let client = NetworkClient.shared
    
    // MARK: - Lifecycles
    
    // MARK: - Functions
    func generatePlaidToken(request: PlaidTokenRequest?) async -> PlaidTokenResult {
        guard let request = request else { return nil }
        do {
            let data = try JSONEncoder().encode(request)
            let response = try await self.client.request(endpoint: .generatePlaidToken(data: data), type: PlaidTokenResponse.self)
            return .success(response)
        } catch let error {
            return .failure(error as? NetworkError ?? .none)
        }
    }
}
