//
//  HomeVM.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/27/24.
//

import Foundation

struct AssetItem: Identifiable {
    var id = UUID()
    var name: String = Constants.emptyString
}

final class HomeVM: BaseVM {
    // MARK: - Properties
    private var service: AccountService? = AccountService()
    @Published var searchText: String = Constants.emptyString
    @Published var searchButtonIcon: String = Constants.iconSearch
    @Published var offsetSearchButton: Double = 50
    @Published var isLoansExpanded: Bool = true
    @Published var isCurrenciesExpanded: Bool = false
    // Dummy data / Temporary
    var assetItems: [AssetItem] = [
        AssetItem(name: "Row One"),
        AssetItem(name: "Row Two"),
        AssetItem(name: "Row Three")
    ]
    
    // MARK: - Lifecycles
    override init() {
        super.init()
    }
    
    // MARK: - Functions
    func expandSearchBar() {
        if self.offsetSearchButton == 50 {
            self.offsetSearchButton = 230
            self.searchButtonIcon = Constants.iconClose
        } else {
            self.offsetSearchButton = 50
            self.searchButtonIcon = Constants.iconSearch
        }
    }

    func linkAccount() {
        self.generatePlaidLinkToken()
    }
}

extension HomeVM {
    private func generatePlaidLinkToken() {
        let userId = self.userProfile?.id
        let request = PlaidTokenRequest(id: userId)
        Task {
            guard let result = await self.service?.generatePlaidToken(request: request) else { return }
            switch result {
            case .success(let response):
                print(response?.linkToken)
            case .failure(let error):
                print(error)
            }
        }
    }
}
