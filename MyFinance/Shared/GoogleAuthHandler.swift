//
//  GoogleAuthHandler.swift
//  MyFinance
//
//  Created by Shak Feizi on 10/14/24.
//

import Foundation
import GoogleSignIn

final class GoogleAuthHandler {
    // MARK: - Properties
    static let shared = GoogleAuthHandler()
    
    // MARK: - Functions
    @MainActor func signIn() async -> String? {
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

extension GoogleAuthHandler {
    @MainActor func topViewController() -> UIViewController? {
        guard let viewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else { return nil }
        return viewController
    }
}
