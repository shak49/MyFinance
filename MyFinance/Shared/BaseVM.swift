//
//  BaseVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/1/24.
//

import Foundation

class BaseVM: ObservableObject {
    // MARK: - Properties
    @Published var alert: (type: AlertType, isPresented: Bool) = (.unableToProceed, false)
    
    // MARK: - Lifecycles
    
    // MARK: - Functions
}
