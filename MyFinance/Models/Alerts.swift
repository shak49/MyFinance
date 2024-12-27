//
//  Alerts.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/8/24.
//

import SwiftUI

enum AlertType {
    typealias ActionType = () -> Void
    
    case addAccount(primary: ActionType, secondary: ActionType)
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
        case .addAccount(let primary, let secondary):
            Alert(title: Text(Constants.alertNewAccountTitle), primaryButton: .default(Text(Constants.alertButtonLinkAccount), action: primary), secondaryButton: .default(Text(Constants.alertButtonAddSomethingManually), action: secondary))
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
