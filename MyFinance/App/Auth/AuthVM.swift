//
//  AuthVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/6/24.
//

import Foundation
import AuthenticationServices
import GoogleSignIn

final class AuthVM: BaseVM {
    // MARK: - Properties
    private var service: AuthService? = AuthService()
    private var profileSetting = ProfileSetting.shared
    private var ssoUtility = SSOUtility.shared
    private var currentNonce: String?
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
    
    @MainActor func performAppleSignIn() {
        self.isLoading = true
        self.initiateAppleAuth()
    }
    
    @MainActor func performGoogleSignIn(router: Router) {
        self.isLoading = true
        Task {
            guard let idToken = await self.initiateGoogleAuth() else { return }
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

extension AuthVM {
    @MainActor private func initiateAppleAuth() {
        let nonce = self.ssoUtility.randomNonceString()
        self.currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.email, .fullName]
        request.nonce = self.ssoUtility.sha256(nonce)
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    @MainActor private func initiateGoogleAuth() async -> String? {
        guard let viewController = self.ssoUtility.topViewController() else { return nil }
        do {
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: viewController)
            let idToken = result.user.idToken
            return idToken?.tokenString
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
        return nil
    }
}

extension AuthVM: ASAuthorizationControllerDelegate {
    @MainActor func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        Task {
            if let appleIdCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                guard let nonce = self.currentNonce else { return }
                guard let appleId = appleIdCredential.identityToken else { return }
                guard let idToken = String(data: appleId, encoding: .utf8) else { return }
                await self.appleAuthCallback(idToken: idToken)
            }
        }
    }
}

extension AuthVM {
    @MainActor private func appleAuthCallback(idToken: String?) async {
        guard let idToken = idToken else { return }
        guard let result = await self.service?.appleSignIn(token: idToken) else { return }
        switch result {
        case .success(let response):
            guard let token = response?.token else { return }
            self.isLoading = false
            self.profileSetting.accessToken = token
            //router.navigateTo(screen: .main)
        case .failure(let error):
            self.isLoading = false
            self.alert.type = .unableToSignInWithGoogle
            self.alert.message = error.localizedDescription
            self.alert.isPresented = true
        }
    }
}
