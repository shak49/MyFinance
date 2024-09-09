//
//  Alerts.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/8/24.
//

import SwiftUI

enum AlertType {
    case success
    case unableToProceed
    case unableToSignIn
    case unableToSignUp
    
    var display: Alert {
        switch self {
        case .success:
            Alert(title: Text(Constants.alertSuccessTitle), message: Text(Constants.alertSuccessMessage), primaryButton: .default(Text(Constants.alertButtonOk), action: {
                
            }), secondaryButton: .cancel({
                
            }))
        case .unableToProceed:
            Alert(title: Text(Constants.alertErrorTitle), message: Text(Constants.alertCannotProceedMessage), dismissButton: .cancel(Text(Constants.alertButtonDismiss)))
        case .unableToSignIn:
            Alert(title: Text(Constants.alertErrorTitle), message: Text(Constants.alertCannotSignInMessage), dismissButton: .cancel(Text(Constants.alertButtonDismiss)))
        case .unableToSignUp:
            Alert(title: Text(Constants.alertErrorTitle), message: Text(Constants.alertCannotSignUpMessage), dismissButton: .cancel(Text(Constants.alertButtonDismiss)))
        }
    }
}
