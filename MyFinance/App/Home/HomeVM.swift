//
//  HomeVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/27/24.
//

import Foundation

final class HomeVM: BaseVM {
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override init() {
        super.init()
        Task {
            await self.getAvatorColor()
            await self.createInitials()
        }
    }
    
    // MARK: - Functions
    @MainActor func getAvatorColor() {
        Task {
            guard var currentUser = await ProfileSetting.shared.getCurrentUser() else { return }
            var avator = currentUser.avator
            let index = avator.index(avator.startIndex, offsetBy: 0)
            avator.remove(at: index)
            self.avator = String(avator)
        }
    }
    
    @MainActor func createInitials() {
        Task {
            guard var currentUser = await ProfileSetting.shared.getCurrentUser() else { return }
            let firstInitial = String(currentUser.firstname.first!)
            let lastInitial = String(currentUser.lastname.first!)
            self.nameInitial = firstInitial + lastInitial
        }
    }
}
