//
//  Auth.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/16/24.
//

import Foundation

struct SignUpRequest: Codable {
    let firstname: String
    let lastname: String
    let email: String
    let password: String
}

struct SignInRequest: Codable {
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

struct AppleSignInRequest: Codable {
    let token: String
    let email: String
    let appleId: String
}

struct AuthResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case token = "access_token"
    }
    
    let token: String?
}

struct SignOutResponse: Codable {
    let message: String?
}
