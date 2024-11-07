//
//  SignInView.swift
//  MyFinance
//
//  Created by Shak Feizi on 8/31/24.
//

import SwiftUI
import AuthenticationServices

struct SignInView: View {
    // MARK: - Properties
    @EnvironmentObject var router: Router
    @StateObject var model = AuthVM()
    
    // MARK: - Lifecycles
    
    // MARK: - Body
    var body: some View {
        ContainerView(isLoading: self.model.isLoading, alert: self.model.alert) {
            VStack {
                VStack(spacing: 16) {
                    MyFinanceCustomTextField(text: self.$model.email, placeholder: Constants.placeholderEmail, type: .email)
                    MyFinanceCustomTextField(text: self.$model.password, placeholder: Constants.placeholderPassword, type: .password)
                }
                Spacer()
                VStack(spacing: 40) {
                    VStack(spacing: 16) {
                        MyFinanceButtonView(type: .primary, label: Constants.signIn) {
                            self.model.performSignIn()
                        }
                        MyFinanceButtonView(type: .secondary, label: Constants.signUp) {
                            self.router.navigateTo(screen: .signUp)
                        }
                        HStack {
                            Button {
                                self.router.navigateTo(screen: .recoverPassword)
                            } label: {
                                Text("Forgot password?")
                                    .foregroundStyle(.primaryButton)
                            }
                            Spacer()
                        }
                    }
                    HStack(spacing: 32) {
                        MyFinanceButtonView(type: .sso(.google)) {
                            self.model.performGoogleSignIn()
                        }
                        MyFinanceButtonView(type: .sso(.apple)) {
                            self.model.performAppleSignIn()
                        }
                    }
                }
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 96)
        }
        .onAppear {
            self.model.setup(router: self.router)
        }
    }
}

#Preview {
    SignInView()
}
