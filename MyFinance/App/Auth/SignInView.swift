//
//  SignInView.swift
//  MyFinance
//
//  Created by Shak Feizi on 8/31/24.
//

import SwiftUI

struct SignInView: View {
    // MARK: - Properties
    @EnvironmentObject var router: Router
    @StateObject var model = AuthVM()
    
    // MARK: - Lifecycles
    
    // MARK: - Body
    var body: some View {
        ContainerView(isLoading: self.model.isLoading, alert: self.model.alert) {
            VStack(spacing: 64) {
                Label {
                    Text(Constants.signInLabel)
                        .font(.system(size: 24))
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.textAccentW)
                } icon: {
                    
                }
                .frame(height: 100)
                VStack(spacing: 16) {
                    CustomTextField(name: self.$model.email, placeholder: Constants.placeholderEmail, type: .email)
                    CustomTextField(name: self.$model.password, placeholder: Constants.placeholderPassword, type: .password)
                }
                VStack(spacing: 40) {
                    VStack(spacing: 16) {
                        ButtonView(type: .primary, label: Constants.signIn) {
                            self.model.performSignIn(router: self.router)
                        }
                        ButtonView(type: .secondary, label: Constants.signUp) {
                            self.router.navigateTo(screen: .signUp)
                        }
                    }
                    HStack(spacing: 32) {
                        ButtonView(type: .sso) {
                            self.model.performGoogleSignIn()
                        }
                        ButtonView(type: .sso) {
                            self.model.performAppleSignIn()
                        }
                    }
                }
            }
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    SignInView()
}
