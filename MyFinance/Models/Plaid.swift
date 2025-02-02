//
//  Plaid.swift
//  MyFinance
//
//  Created by Shak Feizi on 2/1/25.
//

import Foundation

struct PlaidTokenRequest: Codable {
    let id: String?
}

struct PlaidTokenResponse: Codable {
    let linkToken: String?
    let expiration: String?
}
