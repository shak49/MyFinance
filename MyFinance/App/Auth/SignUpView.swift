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
        ContainerView(isLoading: self.model.isLoading, alert: self.model.alert) {
            VStack(spacing: 40) {
                VStack(spacing: 40) {
                    BasicTextField(name: self.$model.fistname, placeholder: Constants.placeholderFirstname)
                    BasicTextField(name: self.$model.lastname, placeholder: Constants.placeholderLastname)
                }
                VStack(spacing: 16) {
                    ValidationTextFieldView(field: self.$model.emailField) {
                        self.model.emailField.onSubmitError()
                    }
                    ValidationTextFieldView(field: self.$model.passwordField) {
                        self.model.passwordField.onSubmitError()
                    }
                }
                VStack(spacing: 16) {
                    ButtonView(type: .primary, label: Constants.signUp) {
                        self.model.performSignUp(router: self.router)
                    }
                    ButtonView(type: .secondary, label: Constants.signIn) {
                        self.router.navigateTo(screen: .signIn)
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
