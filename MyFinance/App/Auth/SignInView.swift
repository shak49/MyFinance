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
                    CustomTextField(text: self.$model.email, placeholder: Constants.placeholderEmail, type: .email)
                    CustomTextField(text: self.$model.password, placeholder: Constants.placeholderPassword, type: .password)
                }
                Spacer()
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
                        ButtonView(type: .sso(.google)) {
                            self.model.performGoogleSignIn(router: self.router)
                        }
                        ButtonView(type: .sso(.apple)) {
                            self.model.performAppleSignIn(router: self.router)
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
