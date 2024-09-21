//
//  Auth.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/16/24.
//

import Foundation

struct AuthRequest: Codable {
    let firstname: String?
    let lastname: String?
    let email: String
    let password: String
    
    init(firstname: String? = Constants.emptyString, lastname: String? = Constants.emptyString, email: String, password: String) {
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
    }
}

struct AuthResponse: Codable {
    let id: String
    let firstname: String
    let lastname: String
    let email: String
    let password: String
}
