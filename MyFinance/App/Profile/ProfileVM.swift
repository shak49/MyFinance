//
//  ProfileVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/27/24.
//

import Foundation

struct UserProfile {
    var user: User?
    var id: String? {
        guard let user = user else { return "" }
        return user.id
    }
    var fullname: String? {
        if let firstname = self.user?.firstname,
           let lastname = self.user?.lastname {
            return firstname + Constants.spaceString + lastname
        }
        return nil
    }
    var initial: String? {
        if let firstInitial = self.user?.firstname.first,
           let lastInitial = self.user?.lastname.first {
            return String(firstInitial) + String(lastInitial)
        }
        return nil
    }
    var avator: String? {
        if var avator = self.user?.avator {
            let index = avator.index(avator.startIndex, offsetBy: 0)
            avator.remove(at: index)
            return avator
        }
        return nil
    }
}

final class ProfileVM: BaseVM {
    // MARK: - Properties
    private var service: AuthService? = AuthService()
    
    // MARK: - Lifecycles
    override init() {
        super.init()
    }
    
    // MARK: - Functions
    func preformSignOut(router: Router?) {
        Task {
            await self.service?.signOut()
            router?.navigateTo(screen: .signIn)
        }
    }
}
