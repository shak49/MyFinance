//
//  RecoverPasswordView.swift
//  MyFinance
//
//  Created by Shak Feizi on 10/31/24.
//

import SwiftUI

struct RecoverPasswordView: View {
    // MARK: - Properties
    @StateObject var model = AuthVM()
    
    // MARK: - Body
    var body: some View {
        ContainerView {
            VStack(spacing: 64) {
                Label {
                    Text("Please enter your email used for sign up to retrieve your password.")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 24))
                } icon: {}
                    .foregroundStyle(.primaryButton)
                    .padding(.horizontal, 32)
                VStack(spacing: 32) {
                    MyFinanceCustomTextField(text: self.$model.password, placeholder: "Enter here...", type: .normal)
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
    RecoverPasswordView()
}
