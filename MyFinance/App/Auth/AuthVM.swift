//
//  AuthVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/6/24.
//

import Foundation

final class AuthVM: BaseVM {
    // MARK: - Properties
    @Published var fistname: String = Constants.emptyString
    @Published var lastname: String = Constants.emptyString
    @Published var email: String = Constants.emptyString
    @Published var password: String = Constants.emptyString
    private var service: AuthService? = AuthService()
    
    // MARK: - Lifecycles
    
    // MARK: - Functions
    @MainActor func performSignUp(router: Router) {
        let request = SignUpRequest(firstname: self.fistname, lastname: self.lastname, email: self.email, password: self.password)
        self.isLoading = true
        Task {
            guard let result = await self.service?.signUp(request: request) else { return }
            switch result {
            case .success(let response):
                guard let token = response?.token else { return }
                self.isLoading = false
                ProfileSetting.shared.accessToken = token
                self.toast.type = .success
                self.toast.isPresented = true
                router.navigateTo(screen: .main)
            case .failure(let error):
                self.isLoading = false
                self.alert.type = .unableToSignUp
                self.alert.message = error.description
                self.alert.isPresented = true
            }
        }
    }
    
    @MainActor func performSignIn(router: Router) {
        let request = SignInRequest(email: self.email, password: self.password)
        self.isLoading = true
        Task {
            guard let result = await self.service?.signIn(request: request) else { return }
            switch result {
            case .success(let response):
                guard let token = response?.token else { return }
                self.isLoading = false
                ProfileSetting.shared.accessToken = token
                router.navigateTo(screen: .main)
            case .failure(let error):
                self.isLoading = false
                self.alert.type = .unableToSignIn
                self.alert.message = error.description
                self.alert.isPresented = true
            }
        }
    }
    
    @MainActor func performAppleSignIn(token: String?, appleId: String?, router: Router) {
        guard let token = token, let appleId = appleId else { return }
        let request = AppleSignInRequest(token: token, email: self.email, appleId: appleId)
        self.isLoading = true
        Task {
            guard let result = await self.service?.appleSignIn(request: request) else { return }
            switch result {
            case .success(let response):
                guard let token = response?.token else { return }
                self.isLoading = false
                ProfileSetting.shared.accessToken = token
                router.navigateTo(screen: .main)
            case .failure(let error):
                self.isLoading = false
                self.alert.type = .unableToSignUpWithApple
                self.alert.message = error.localizedDescription
                self.alert.isPresented = true
            }
        }
    }
    
    func performGoogleSignIn() {
        
    }
}
