//
//  ButtonView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/6/24.
//

import SwiftUI

enum ButtonType {
    case primary
    case secondary
    case sso
}

struct ButtonView: View {
    // MARK: - Properties
    let type: ButtonType
    let label: String
    let icon: String
    let action: () -> Void
    
    // MARK: - Lifecycles
    init(type: ButtonType, label: String? = nil, icon: String? = nil, action: @escaping () -> Void) {
        self.type = type
        self.label = label ?? ""
        self.icon = icon ?? ""
        self.action = action
    }
    
    // MARK: - Body
    var body: some View {
        switch type {
        case .primary:
            self.primary
        case .secondary:
            self.secondary
        case .sso:
            self.sso
        }
    }
}

extension ButtonView {
    var primary: some View {
        Button {
            self.action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .foregroundColor(.primaryButton)
                Text(self.label)
                    .foregroundStyle(.textAccentB)
            }
            .frame(height: 50)
        }
    }
    var secondary: some View {
        Button {
            self.action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .foregroundColor(.secondaryButton)
                Text(self.label)
                    .foregroundStyle(.textAccentW)
            }
            .frame(height: 50)
        }
    }
    var sso: some View {
        Button {
            self.action()
        } label: {
            Circle()
                .frame(width: 34)
                .foregroundStyle(.gray)
        }
    }
}
