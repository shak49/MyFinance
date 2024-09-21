//
//  AuthVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/6/24.
//

import Foundation
import SwiftUI

final class AuthVM: BaseVM {
    // MARK: - Properties
    @Published var fistname: String = Constants.emptyString
    @Published var lastname: String = Constants.emptyString
    @Published var email: String = Constants.emptyString
    @Published var password: String = Constants.emptyString
    private var auth: AuthService? = AuthService()
    
    // MARK: - Lifecycles
    
    // MARK: - Functions
    func performSignIn(router: Router) {

    }
    
    @MainActor func performSignUp(router: Router) {
        let user = AuthRequest(firstname: self.fistname, lastname: self.lastname, email: self.email, password: self.password)
        self.isLoading = true
        Task {
            guard let result = await self.auth?.signUp(user: user) else { return }
            switch result {
            case .success:
                self.isLoading = false
                self.toast.type = .success
                self.toast.isPresented = true
                router.navigateTo(screen: .main)
            case .failure(let error):
                self.isLoading = false
                self.alert.type = .unableToSignUp
                self.alert.message = error.localizedDescription
                self.alert.isPresented = true
            }
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
