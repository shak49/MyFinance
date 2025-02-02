//
//  Endpoint.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/15/24.
//

import Foundation

enum Endpoint {
    // Auth
    case signUp(data: Data?)
    case signIn(data: Data?)
    case appleSignIn(token: String)
    case googleSignIn(token: String)
    case signOut
    // Profile
    case currentUser(token: String)
    // Account
    case generatePlaidToken(data: Data?)
}

extension Endpoint {
    enum MethodType {
        case GET(token: String? = nil)
        case POST(data: Data?)
    }
}

extension Endpoint {
    var host: String {
        return "myfinance-4w04.onrender.com"
    }
    var path: String {
        switch self {
        case .signUp:
            return "/auth/sign-up"
        case .signIn:
            return "/auth/sign-in"
        case .appleSignIn:
            return "/auth/apple"
        case .googleSignIn:
            return "/auth/google"
        case .signOut:
            return "/auth/sign-out"
        case .currentUser:
            return "/profile/current-user"
        case .generatePlaidToken:
            return "/account/generate-plaid-token/"
        }
    }
    var method: MethodType {
        switch self {
        case .signUp(let data):
            return .POST(data: data)
        case .signIn(let data):
            return .POST(data: data)
        case .appleSignIn(let token):
            return .GET(token: token)
        case .googleSignIn(let token):
            return .GET(token: token)
        case .signOut:
            return .GET()
        case .currentUser(let token):
            return .GET(token: token)
        case .generatePlaidToken(let data):
            return .POST(data: data)
        }
    }
    var queryItems: [URLQueryItem] {
        var items: [URLQueryItem] = []
        switch self {
        case .signUp, .signIn, .appleSignIn, .googleSignIn, .signOut, .currentUser, .generatePlaidToken:
            break
        }
        return items
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = self.host
        components.path = self.path
        components.queryItems = self.queryItems
        return components.url
    }
}
