//
//  Endpoint.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/15/24.
//

import Foundation

enum Endpoint {
    case signUp(data: Data?)
    case signIn(data: Data?)
    case appleSignIn(token: String)
    case googleSignIn(token: String)
    case currentUser(token: String)
    case signOut
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
        case .currentUser:
            return "/profile/current-user"
        case .signOut:
            return "/auth/sign-out"
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
        case .currentUser(let token):
            return .GET(token: token)
        case .signOut:
            return .GET()
        }
    }
    var queryItems: [URLQueryItem] {
        var items: [URLQueryItem] = []
        switch self {
        case .signUp, .signIn, .appleSignIn, .googleSignIn, .currentUser, .signOut:
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
