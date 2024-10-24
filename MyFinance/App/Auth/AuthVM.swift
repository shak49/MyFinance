//
//  AuthVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/6/24.
//

import Foundation

final class AuthVM: BaseVM {
    // MARK: - Properties
    private var service: AuthService? = AuthService()
    private var profileSetting = ProfileSetting.shared
    private var ssoUtility = SSOUtility.shared
    @Published var fistname: String = Constants.emptyString
    @Published var lastname: String = Constants.emptyString
    @Published var email: String = Constants.emptyString
    @Published var password: String = Constants.emptyString
    
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
                self.profileSetting.accessToken = token
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
                self.profileSetting.accessToken = token
                router.navigateTo(screen: .main)
            case .failure(let error):
                self.isLoading = false
                self.alert.type = .unableToSignIn
                self.alert.message = error.description
                self.alert.isPresented = true
            }
        }
    }
    
    @MainActor func performAppleSignIn(router: Router) {
        self.isLoading = true
        Task {
            await self.ssoUtility.initiateAppleAuth()
            guard let credentials = self.ssoUtility.appleCredentials else { return }
            self.isLoading = false
        }
    }
    
    @MainActor func performGoogleSignIn(router: Router) {
        self.isLoading = true
        Task {
            guard let idToken = await self.ssoUtility.initiateGoogleAuth() else { return }
            guard let result = await self.service?.googleSignIn(token: idToken) else { return }
            switch result {
            case .success(let response):
                guard let token = response?.token else { return }
                self.isLoading = false
                self.profileSetting.accessToken = token
                router.navigateTo(screen: .main)
            case .failure(let error):
                self.isLoading = false
                self.alert.type = .unableToSignInWithGoogle
                self.alert.message = error.localizedDescription
                self.alert.isPresented = true
            }
        }
    }
}
