//
//  AppleCredential.swift
//  MyFinance
//
//  Created by Shak Feizi on 10/18/24.
//

import Foundation

struct AppleCredential {
    let idToken: String?
    let nonce: String?
    
    init(idToken: String? = Constants.emptyString, nonce: String? = Constants.emptyString) {
        self.idToken = idToken
        self.nonce = nonce
    }
}
