//
//  UserSetting.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/23/24.
//

import Foundation

final class UserSetting {
    // MARK: - Properties
    static let shared = UserSetting()
    private var service = ProfileService()
    var accessToken: String? = Constants.emptyString
    
    // MARK: - Lifecycles
    private init() {}
    
    // MARK: - Functions
    func getCurrentUser() async -> User? {
        guard let token = self.accessToken else { return nil }
        return await self.service.currentUser(token: token)
    }
}
