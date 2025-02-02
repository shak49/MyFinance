//
//  BaseVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/1/24.
//

import Foundation

@MainActor
class BaseVM: NSObject, ObservableObject {
    // MARK: - Properties
    @Published var isLoading: Bool = false
    @Published var alert: Alerts = .init(type: .unableToProceed, message: Constants.emptyString, isPresented: false)
    @Published var toast: Toast = .init(type: .info, isPresented: false)
    @Published var sheet: Sheets = .init(isPresented: false)
    @Published var userProfile: UserProfile?
    
    // MARK: - Lifecycles
    override init() {
        super.init()
        Task {
            await self.getUserProfile()
        }
    }
    
    // MARK: - Functions
    func getUserProfile() {
        Task {
            guard let currentUser = await UserSetting.shared.getCurrentUser() else { return }
            self.userProfile = UserProfile(user: currentUser)
        }
    }
}
