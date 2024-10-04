//
//  Toast.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/20/24.
//

import SwiftUI

enum ToastType {
    case info
    case success
    case warning
    case error
    case newFeature
}

struct Toast: Equatable {
    var type: ToastType
    var isPresented: Bool
    var message: String?
    var color: Color {
        switch self.type {
        case .info:
            return .blue
        case .success:
            return .green
        case .warning:
            return .yellow
        case .error:
            return .red
        case .newFeature:
            return .purple
        }
    }
    var icon: String {
        switch self.type {
        case .info:
            return Constants.iconInfo
        case .success:
            return Constants.iconSuccess
        case .warning:
            return Constants.iconWarning
        case .error:
            return Constants.iconError
        case .newFeature:
            return Constants.iconPlay
        }
    }
}
