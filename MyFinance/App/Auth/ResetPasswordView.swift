//
//  ResetPasswordView.swift
//  MyFinance
//
//  Created by Shak Feizi on 10/31/24.
//

import SwiftUI

struct ResetPasswordView: View {
    // MARK: - Properties
    @StateObject var model = AuthVM()
    
    // MARK: - Body
    var body: some View {
        ContainerView {
            VStack(spacing: 64) {
                Label {
                    Text("Please create your new password.")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 24))
                } icon: {}
                    .foregroundStyle(.primaryButton)
                    .padding(.horizontal, 32)
                VStack {
                    MyFinanceCustomTextField(text: self.$model.email, placeholder: "Enter here...", type: .normal)
                    Spacer()
                    MyFinanceButtonView(type: .primary, label: "Continue") {
                        self.model.performPasswordRecovery()
                    }
                }
                .padding(.horizontal, 32)
            }
            .padding(.vertical, 64)
        }
    }
}

#Preview {
    ResetPasswordView()
}
