//
//  User.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/26/24.
//

import Foundation

struct User: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case avator = "avator_color"
        case firstname, lastname, email
    }
    
    let id: String
    let firstname: String
    let lastname: String
    let email: String
    let avator: String
}
