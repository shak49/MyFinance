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
        ContainerView(isLoading: self.model.isLoading, alert: self.model.alert, toast: self.model.toast) {
            VStack(spacing: 40) {
                VStack(spacing: 16) {
                    CustomTextField(name: self.$model.fistname, placeholder: Constants.placeholderFirstname, type: .normal)
                    CustomTextField(name: self.$model.lastname, placeholder: Constants.placeholderLastname, type: .normal)
                    CustomTextField(name: self.$model.email, placeholder: Constants.placeholderEmail, type: .email)
                    CustomTextField(name: self.$model.password, placeholder: Constants.placeholderPassword, type: .password)
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
