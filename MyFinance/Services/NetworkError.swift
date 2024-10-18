//
//  NetworkError.swift
//  MyFinance
//
//  Created by Shak Feizi on 10/4/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidRequest
    case status(code: Int?)
    case unableToDecode
    case none
    
    var description: String {
        switch self {
        case .invalidURL:
            return Constants.networkErrorInvlaidURLMessage
        case .invalidRequest:
            return Constants.networkErrorInvlaidRequestMessage
        case .status(let code):
            return self.statusMessage(code: code)
        case .unableToDecode:
            return Constants.networkErrorUnableToDecodeMessage
        default:
            return Constants.emptyString
        }
    }
}

extension NetworkError {
    private func statusMessage(code: Int?) -> String {
        switch code {
        case 401:
            return Constants.statusCodeEmailExistsMessage
        case 402:
            return Constants.statusCodeUnableToVerifyFieldsMessage
        case 403:
            return Constants.statusCodeUserDoesNotExistMessage
        case 404:
            return Constants.statusCodeInvalidCredentials
        case 500:
            return Constants.statusCodeInternalServerErrorMessage
        default:
            return Constants.emptyString
        }
    }
}
