//
//  AuthVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/6/24.
//

import Foundation

final class AuthVM: BaseVM {
    // MARK: - Properties
    @Published var fistname: String = ""
    @Published var lastname: String = ""
    @Published var emailField = FieldModel(value: Constants.emptyString, type: .email)
    @Published var passwordField = FieldModel(value: Constants.emptyString, type: .password)
    @Published var isLoading: Bool = false
    private var auth: AuthService?
    
    // MARK: - Lifecycles
    
    // MARK: - Functions
    func performSignIn(router: Router) {
        self.alert.type = .unableToSignIn
        self.alert.isPresented = true
        //router.navigateTo(screen: .main)
    }
    
    @MainActor func performSignUp(router: Router) {
        guard let email = self.emailField.value,
              let password = self.passwordField.value else { return }
        let user = UserRequest(firstname: self.fistname, lastname: self.lastname, email: email, password: password)
        Task {
            guard let response = await self.auth?.signUp(user: user) else {
                self.alert.type = .unableToSignUp
                self.alert.isPresented = true
                return
            }
            print(response)
            router.navigateTo(screen: .main)
        }
    }
    
    func performGoogleSignIn() {
        
    }
    
    func performGoogleSignUp() {
        
    }
    
    func performAppleSignIn() {
        
    }
    
    func performAppleSignUp() {
        
    }
}
