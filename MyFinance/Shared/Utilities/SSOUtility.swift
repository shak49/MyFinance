//
//  SSOUtility.swift
//  MyFinance
//
//  Created by Shak Feizi on 10/14/24.
//

import Foundation
import AuthenticationServices
import GoogleSignIn
import CryptoKit

final class SSOUtility: NSObject {
    // MARK: - Properties
    static let shared = SSOUtility()
    fileprivate var currentNonce: String?
    var appleCredentials: AppleCredential?
    
    // MARK: - Functions
    @MainActor func initiateAppleAuth() async {
        let nonce = self.randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.email, .fullName]
        request.nonce = self.sha256(nonce)
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    @MainActor func initiateGoogleAuth() async -> String? {
        guard let viewController = self.topViewController() else { return nil }
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

extension SSOUtility {
    @MainActor func topViewController() -> UIViewController? {
        guard let viewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else { return nil }
        return viewController
    }
}

extension SSOUtility {
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        if errorCode != errSecSuccess {
            fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
        }
        let charset: [Character] = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        let nonce = randomBytes.map { byte in
            charset[Int(byte) % charset.count]
        }
        return String(nonce)
    }
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        return hashString
    }
}

extension SSOUtility: ASAuthorizationControllerDelegate {
    @MainActor public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIdCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = self.currentNonce else { return }
            guard let appleIdToken = appleIdCredential.identityToken else { return }
            guard let idTokenString = String(data: appleIdToken, encoding: .utf8) else { return }
            self.appleCredentials = AppleCredential(idToken: idTokenString, nonce: nonce)
        }
    }
}
