//
//  Auth.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/16/24.
//

import Foundation

struct SignUpRequest: Codable {
    let firstname: String?
    let lastname: String?
    let email: String
    let password: String
}

struct SignUpResponse: Codable {
    let id: String
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

struct SignInResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case token = "id_token"
    }
    
    let token: String?
}
