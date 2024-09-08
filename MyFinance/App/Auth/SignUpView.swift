//
//  SignUpView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/7/24.
//

import SwiftUI

struct SignUpView: View {
    // MARK: - Properties
    @EnvironmentObject var router: Router
    @StateObject var model = AuthVM()
    
    // MARK: - Lifecycles
    
    // MARK: - Body
    var body: some View {
        ContainerView(isLoading: self.model.isLoading) {
            VStack(spacing: 64) {
                Label {
                    Text(Constants.signUpLabel)
                        .font(.system(size: 24))
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.textAccentW)
                } icon: {
                    
                }
                .frame(height: 100)
                VStack(spacing: 16) {
                    ValidationTextFieldView(field: self.$model.emailField) {
                        self.model.emailField.onSubmitError()
                    }
                    ValidationTextFieldView(field: self.$model.passwordField) {
                        self.model.passwordField.onSubmitError()
                    }
                }
                VStack(spacing: 40) {
                    VStack(spacing: 16) {
                        ButtonView(type: .primary, label: Constants.signUp) {
                            self.model.performSignUp(router: self.router)
                        }
                        ButtonView(type: .secondary, label: Constants.signIn) {
                            self.router.navigateTo(screen: .signUp)
                        }
                    }
                    HStack(spacing: 32) {
                        ButtonView(type: .sso) {
                            self.model.performGoogleSignUp()
                        }
                        ButtonView(type: .sso) {
                            self.model.performAppleSignUp()
                        }
                    }
                }
            }
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    SignUpView()
}
