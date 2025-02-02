//
//  SettingsVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/26/24.
//

import Foundation

final class SettingsVM: BaseVM {
    // MARK: - Properties
    private var service = AuthService()
    
    // MARK: - Lifecycles

    // MARK: - Functions
    func preformSignOut(router: Router) {
        Task {
            await self.service.signOut()
            router.navigateTo(screen: .signIn)
        }
    }
}
