//
//  BaseVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/1/24.
//

import Foundation

class BaseVM: ObservableObject {
    // MARK: - Properties
    @Published var isLoading: Bool = false
    @Published var alert: CustomAlert = CustomAlert(type: .unableToProceed, message: Constants.emptyString, isPresented: false)
    @Published var toast: Toast = .init(type: .info, isPresented: false)
    
    // MARK: - Lifecycles
    
    // MARK: - Functions
}
