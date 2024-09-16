//
//  UserRequest.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/16/24.
//

import Foundation

struct UserRequest: Codable {
    let firstname: String
    let lastname: String
    let email: String
    let password: String
    
    init(firstname: String, lastname: String, email: String, password: String) {
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
    }
}

struct UserResponse: Codable {
    
}
