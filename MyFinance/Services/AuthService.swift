//
//  AuthService.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/16/24.
//

import Foundation

protocol AuthInterface {
    typealias AuthResult = Result<AuthResponse?, NetworkError>?

    func signUp(request: SignUpRequest?) async -> AuthResult
    func signIn(request: SignInRequest?) async -> AuthResult
    func appleSignIn(token: String?) async -> AuthResult
    func googleSignIn(token: String?) async -> AuthResult
    func signOut() async
}

final class AuthService: AuthInterface {
    // MARK: - Properties
    private let client = NetworkClient.shared
    
    // MARK: - Lifecycles
    
    // MARK: - Functions
    func signUp(request: SignUpRequest?) async -> AuthResult {
        guard let request = request else { return nil }
        do {
            let data = try JSONEncoder().encode(request)
            let response = try await self.client.request(endpoint: .signUp(data: data), type: AuthResponse.self)
            return .success(response)
        } catch let error {
            return .failure(error as? NetworkError ?? .none)
        }
    }
    
    func signIn(request: SignInRequest?) async -> AuthResult {
        guard let request = request else { return nil }
        do {
            let data = try JSONEncoder().encode(request)
            let response = try await self.client.request(endpoint: .signIn(data: data), type: AuthResponse.self)
            return .success(response)
        } catch let error {
            return .failure(error as? NetworkError ?? .none)
        }
    }
    
    func appleSignIn(token: String?) async -> AuthResult {
        guard let token = token else { return nil }
        do {
            let response = try await self.client.request(endpoint: .appleSignIn(token: token), type: AuthResponse.self)
            return .success(response)
        } catch let error {
            return .failure(error as? NetworkError ?? .none)
        }
    }
    
    func googleSignIn(token: String?) async -> AuthResult {
        guard let token = token else { return nil }
        do {
            let response = try await self.client.request(endpoint: .googleSignIn(token: token), type: AuthResponse.self)
            return .success(response)
        } catch let error {
            return .failure(error as? NetworkError ?? .none)
        }
    }
    
    func signOut() async {
        do {
            let response = try await self.client.request(endpoint: .signOut, type: SignOutResponse.self)
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }
}
