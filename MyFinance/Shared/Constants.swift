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
    static let alertNewAccountTitle = "New Account"
    static let alertButtonDismiss = "Dismiss"
    static let alertButtonLinkAccount = "Link An Account"
    static let alertButtonAddSomethingManually = "Add Something Manually"
    static let alertButtonOk = "Ok"
    static let alertErrorTitle = "Error"
    static let alertSuccessTitle = "Success"
    static let alertCannotProceedMessage = "Unable to proceed!"
    static let alertCannotSignInMessage = "Unable to sign in!"
    static let alertCannotSignUpMessage = "Unable to sign up!"
    // MARK: - Auth Labels
    static let signInLabel = "Enter your information to sign in to your account!"
    static let signUpLabel = "Enter your information to sign up!"
    // MARK: - Home Labels
    static let homeBalanceLabel = "Your balance"
    static let homeBalanceAmount = "$0,000"
    static let homeFinanceLabel = "Finance"
    static let homeCurrentLoansLabel = "CURRENT LOANS"
    static let homeCurrenciesAndMetalsLabel = "CURRENCIES AND METALS"
    // MARK: - Button Titles
    static let signIn = "Sign In"
    static let signUp = "Sign Up"
    // MARK: - Icons
    static let iconInfo = "info.circle"
    static let iconSuccess = "checkmark.circle"
    static let iconWarning = "exclamationmark.triangle"
    static let iconError = "xmark.circle"
    static let iconPlay = "play.circle"
    static let iconSearch = "magnifyingglass"
    static let iconClose = "xmark"
    // MARK: - Network Errors
    static let networkErrorInvlaidURLMessage = "This URL is not valid."
    static let networkErrorInvlaidRequestMessage = "This request is not valid."
    static let networkErrorUnableToDecodeMessage = "Unable to decode."
    // MARK: - Placeholder Texts
    static let placeholderFirstname = "Enter your first name..."
    static let placeholderLastname = "Enter your last name..."
    static let placeholderEmail = "Enter your email..."
    static let placeholderPassword = "Enter your password..."
    static let placeholderTypeHere = "Type here..."
    // MARK: - Status Code Messages
    static let statusCodeEmailExistsMessage = "This email already exists!"
    static let statusCodeInvalidCredentials = "Invalid credentials!"
    static let statusCodeInternalServerErrorMessage = "Internal server error!"
    static let statusCodeUnableToVerifyFieldsMessage = "Unable to verify fields!"
    static let statusCodeUserDoesNotExistMessage = "This user doesn't exist!"
    // MARK: - Toast Messages
    static let toastInfoMessage = "This feature is currently not available."
    static let toastWelcomeMessage = "Welcome to myFinance. We are pleased to have you."
    static let toastWarningMessage = ""
    static let toastSomethingWentWrongMessage = "Something went wrong! Please try another time."
    static let toastNewFeatureMessage = "A new feature is available. Press to see it."
    // MARK: - Validation Error Texts
    static let errorEmptyEmail = "Email field cannot be empty!"
    static let errorEmail = "Please enter a valid email!"
    static let errorPassword = "Please enter a valid password!"
}
