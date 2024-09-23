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
}

extension Endpoint {
    enum MethodType {
        case GET
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
        }
    }
    var method: MethodType {
        switch self {
        case .signUp(let data):
            return .POST(data: data)
        case .signIn(let data):
            return .POST(data: data)
        }
    }
    var queryItems: [URLQueryItem] {
        var items: [URLQueryItem] = []
        switch self {
        case .signUp, .signIn:
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
