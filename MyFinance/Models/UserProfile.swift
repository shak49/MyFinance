//
//  UserProfile.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/26/24.
//

import Foundation

struct UserProfile: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstname, lastname, email
    }
    
    let id: String
    let firstname: String
    let lastname: String
    let email: String
}
