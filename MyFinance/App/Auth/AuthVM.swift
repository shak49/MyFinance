//
//  AuthVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/6/24.
//

import Foundation

final class AuthVM: BaseVM {
    // MARK: - Properties
    @Published var emailField = FieldModel(value: Constants.emptyString, type: .email)
    @Published var passwordField = FieldModel(value: Constants.emptyString, type: .password)
    @Published var isLoading: Bool = false
    
    // MARK: - Lifecycles
    
    // MARK: - Functions
    func performSignIn(router: Router) {
        self.alert.type = .unableToSignIn
        self.alert.isPresented = true
        //router.navigateTo(screen: .main)
    }
    
    func performSignUp(router: Router) {
        self.alert.type = .unableToSignUp
        self.alert.isPresented = true
        //router.navigateTo(screen: .main)
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
