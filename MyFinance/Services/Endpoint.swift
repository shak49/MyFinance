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
    case appleSignIn(data: Data?)
    case signOut
    case currentUser(token: String)
}

extension Endpoint {
    enum MethodType {
        case GET(token: String? = nil)
        case POST(data: Data?)
        case PUT(data: Data?)
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
        case .signOut:
            return "/auth/sign-out"
        case .currentUser:
            return "/profile/current-user"
        }
    }
    var method: MethodType {
        switch self {
        case .signUp(let data):
            return .POST(data: data)
        case .signIn(let data):
            return .POST(data: data)
        case .appleSignIn(let data):
            return .POST(data: data)
        case .signOut:
            return .GET()
        case .currentUser(let token):
            return .GET(token: token)
        }
    }
    var queryItems: [URLQueryItem] {
        var items: [URLQueryItem] = []
        switch self {
        case .signUp, .signIn, .appleSignIn, .signOut, .currentUser:
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
