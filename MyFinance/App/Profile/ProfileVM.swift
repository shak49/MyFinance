//
//  ProfileVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/27/24.
//

import Foundation

final class ProfileVM: BaseVM {
    // MARK: - Properties
    @Published var fullname: String = Constants.emptyString
    
    // MARK: - Lifecycles
    override init() {
        super.init()
        self.getFullname()
    }
    
    // MARK: - Functions
    func getFullname() {
        Task {
            guard let firstname = await ProfileSetting.shared.getCurrentUser()?.firstname,
                  let lastname = await ProfileSetting.shared.getCurrentUser()?.lastname else { return }
            self.fullname = firstname + " " + lastname
        }
    }
}
