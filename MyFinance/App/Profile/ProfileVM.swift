//
//  ProfileVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/27/24.
//

import Foundation

final class ProfileVM: BaseVM {
    // MARK: - Properties
    private var service: AuthService? = AuthService()
    @Published var fullname: String = Constants.emptyString
    
    // MARK: - Lifecycles
    override init() {
        super.init()
        Task {
            await self.getFullname()
        }
    }
    
    // MARK: - Functions
    @MainActor func getFullname() {
        Task {
            guard let firstname = await ProfileSetting.shared.getCurrentUser()?.firstname,
                  let lastname = await ProfileSetting.shared.getCurrentUser()?.lastname else { return }
            self.fullname = firstname + " " + lastname
        }
    }
    
    @MainActor func preformSignOut(router: Router?) {
        Task {
            await self.service?.signOut()
            router?.navigateTo(screen: .signIn)
        }
    }
}
