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
                            self.model.performSignIn(router: self.router)
                        }
                        MyFinanceButtonView(type: .secondary, label: Constants.signUp) {
                            self.router.navigateTo(screen: .signUp)
                        }
                    }
                    HStack(spacing: 32) {
                        MyFinanceButtonView(type: .sso(.google)) {
                            self.model.performGoogleSignIn(router: self.router)
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
    }
}

#Preview {
    SignInView()
}
