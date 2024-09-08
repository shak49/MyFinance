//
//  AuthVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/6/24.
//

import Foundation

final class AuthVM: ObservableObject {
    // MARK: - Properties
    @Published var emailField = FieldModel(value: Constants.emptyString, type: .email)
    @Published var passwordField = FieldModel(value: Constants.emptyString, type: .password)
    @Published var alert: (type: AlertType, isPresented: Bool) = (.unableToProceed, false)
    @Published var isLoading: Bool = false
    
    // MARK: - Lifecycles
    
    // MARK: - Functions
    func performSignIn(router: Router) {
        self.alert.type = .unableToProceed
        self.alert.isPresented = true
        //router.navigateTo(screen: .main)
    }
    
    func performSignUp(router: Router) {
        router.navigateTo(screen: .main)
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
