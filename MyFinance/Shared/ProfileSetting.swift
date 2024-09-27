//
//  ProfileSetting.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/23/24.
//

import Foundation

final class ProfileSetting {
    // MARK: - Properties
    static let shared = ProfileSetting()
    private var service = ProfileService()
    var accessToken: String? = Constants.emptyString
    
    // MARK: - Lifecycles
    private init() {}
    
    // MARK: - Functions
    func getCurrentUser() async -> UserProfile? {
        guard let token = self.accessToken else { return nil }
        return await self.service.currentUser(token: token)
    }
}
