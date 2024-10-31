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
            VStack {
                VStack(spacing: 16) {
                    MyFinanceCustomTextField(text: self.$model.fistname, placeholder: Constants.placeholderFirstname, type: .normal)
                    MyFinanceCustomTextField(text: self.$model.lastname, placeholder: Constants.placeholderLastname, type: .normal)
                    MyFinanceCustomTextField(text: self.$model.email, placeholder: Constants.placeholderEmail, type: .email)
                    MyFinanceCustomTextField(text: self.$model.password, placeholder: Constants.placeholderPassword, type: .password)
                }
                Spacer()
                VStack(spacing: 16) {
                    MyFinanceButtonView(type: .primary, label: Constants.signUp) {
                        self.model.performSignUp(router: self.router)
                    }
                    MyFinanceButtonView(type: .secondary, label: Constants.signIn) {
                        self.router.navigateTo(screen: .signIn)
                    }
                }
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 96)
        }
    }
}

#Preview {
    SignUpView()
}
