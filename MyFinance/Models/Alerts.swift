//
//  Alerts.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/8/24.
//

import SwiftUI

enum AlertType {
    case unableToProceed
    case unableToSignIn
    case unableToSignInWithGoogle
    case unableToSignUp
    case unableToSignUpWithApple
}

struct Alerts {
    var type: AlertType
    var message: String
    var isPresented: Bool
    var display: Alert {
        switch type {
        case .unableToProceed:
            Alert(title: Text(Constants.alertErrorTitle), message: Text(Constants.alertCannotProceedMessage), dismissButton: .cancel(Text(Constants.alertButtonDismiss)))
        case .unableToSignIn:
            Alert(title: Text(Constants.alertErrorTitle), message: Text(self.message), dismissButton: .cancel(Text(Constants.alertButtonDismiss)))
        case .unableToSignInWithGoogle:
            Alert(title: Text(Constants.alertErrorTitle), message: Text(self.message), dismissButton: .cancel(Text(Constants.alertButtonDismiss)))
        case .unableToSignUp:
            Alert(title: Text(Constants.alertErrorTitle), message: Text(self.message), dismissButton: .cancel(Text(Constants.alertButtonOk)))
        case .unableToSignUpWithApple:
            Alert(title: Text(Constants.alertErrorTitle), message: Text(self.message), dismissButton: .cancel(Text(Constants.alertButtonDismiss)))
        }
    }
}
