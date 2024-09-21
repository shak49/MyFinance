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
    case unableToSignUp
}

struct CustomAlert {
    var type: AlertType
    var message: String
    var isPresented: Bool
    var display: Alert {
        switch type {
        case .unableToProceed:
            Alert(title: Text(Constants.alertErrorTitle), message: Text(Constants.alertCannotProceedMessage), dismissButton: .cancel(Text(Constants.alertButtonDismiss)))
        case .unableToSignIn:
            Alert(title: Text(Constants.alertErrorTitle), message: Text(self.message), dismissButton: .cancel(Text(Constants.alertButtonDismiss)))
        case .unableToSignUp:
            Alert(title: Text(Constants.alertErrorTitle), message: Text(self.message), dismissButton: .cancel(Text(Constants.alertButtonDismiss)))
        }
    }
}
