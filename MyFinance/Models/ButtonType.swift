//
//  ButtonType.swift
//  MyFinance
//
//  Created by Shak Feizi on 10/18/24.
//

import SwiftUI

enum SSOType {
    case apple
    case google
    
    var label: some View {
        switch self {
        case .apple:
            Image("apple")
                .resizable()
                .frame(width: 34, height: 34)
                .background(.white)
                .cornerRadius(17)
        case .google:
            Image("google")
                .resizable()
                .frame(width: 34, height: 34)
                .background(.white)
                .cornerRadius(17)
        }
    }
}

enum ButtonType {
    case primary
    case secondary
    case sso(_ type: SSOType)
    
    var ssoType: SSOType? {
        switch self {
        case .primary, .secondary:
            return nil
        case .sso(let type):
            return type
        }
    }
}
