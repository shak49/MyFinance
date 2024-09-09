//
//  Alerts.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/8/24.
//

import SwiftUI

enum AlertType {
    case unableToProceed
    case success
    
    var display: Alert {
        switch self {
        case .unableToProceed:
            Alert(title: Text(Constants.alertErrorTitle), message: Text(Constants.alertCannotProceedMessage), dismissButton: .cancel(Text(Constants.alertButtonDismiss)))
        case .success:
            Alert(title: Text(Constants.alertSuccessTitle), message: Text(Constants.alertSuccessMessage), primaryButton: .default(Text(Constants.alertButtonOk), action: {
                
            }), secondaryButton: .cancel({
                
            }))
        }
    }
}
