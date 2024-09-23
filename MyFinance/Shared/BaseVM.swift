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
    @Published var authToken: String = Constants.emptyString
    @Published var alert: CustomAlert = CustomAlert(type: .unableToProceed, message: "", isPresented: false)
    @Published var toast: Toast = .init(type: .info, isPresented: false)
    
    // MARK: - Lifecycles
    
    // MARK: - Functions
}
