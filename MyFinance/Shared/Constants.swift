//
//  Constants.swift
//  MyFinance
//
//  Created by Shak Feizi on 8/31/24.
//

import Foundation

struct Constants {
    static let emptyString = ""
    static let predicateFormat = "SELF MATCHES %Q"
    static let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+|\\.[A-Za-z]{2, 64}"
    // MARK: - Alerts
    static let alertButtonDismiss = "Dismiss"
    static let alertButtonOk = "Ok"
    static let alertErrorTitle = "Error"
    static let alertSuccessTitle = "Success"
    static let alertCannotProceedMessage = "Unable to proceed!"
    static let alertCannotSignInMessage = "Unable to sign in!"
    static let alertCannotSignUpMessage = "Unable to sign up!"
    static let alertSuccessMessage = "Account was successfully created."
    // MARK: - Auth Labels
    static let signInLabel = "Enter your information to sign in to your account!"
    static let signUpLabel = "Enter your information to sign up!"
    // MARK: - Button Titles
    static let signIn = "Sign In"
    static let signUp = "Sign Up"
    // MARK: - Placeholder Texts
    static let placeholderFirstname = "Enter your first name..."
    static let placeholderLastname = "Enter your last name..."
    static let placeholderEmail = "Enter your email..."
    static let placeholderPassword = "Enter your password..."
    // MARK: - Validation Error Texts
    static let errorEmptyEmail = "Email field cannot be empty!"
    static let errorEmail = "Please enter a valid email!"
    static let errorPassword = "Please enter a valid password!"
}
