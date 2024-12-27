//
//  HomeView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/7/24.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @EnvironmentObject var router: Router
    @StateObject var model = HomeVM()
    
    // MARK: - Body
    var body: some View {
        ContainerView(toast: self.model.toast) {
            VStack(spacing: 32) {
                self.toolbar
                ScrollView {
                    VStack(spacing: 40) {
                        self.balanceAndSearch
                        self.accountCardScroller
                        self.financeCardScroller
                        self.assetsAndLiabilities
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    private var toolbar: some View {
        HStack {
            Button {
                self.router.navigateTo(screen: .profile)
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color(hex: self.model.avator))
                    Text(self.model.nameInitial)
                        .font(.headline)
                        .foregroundStyle(.textAccentW)
                }
                .overlay {
                    Circle()
                        .stroke(.primaryButton, lineWidth: 1)
                }
            }
            Spacer(minLength: 60)
            Image(.logo)
                .resizable()
                .frame(width: 150, height: 150)
            Spacer(minLength: 100)
        }
        .frame(width: 360, height: 40)
    }
    private var balanceAndSearch: some View {
        VStack(alignment: .leading) {
            Label {
                Text(Constants.homeBalanceLabel)
                    .foregroundStyle(.textAccentW)
            } icon: {
                
            }
            HStack(spacing: 8) {
                Label {
                    Text(Constants.homeBalanceAmount)
                        .font(.system(size: 32))
                        .bold()
                        .foregroundStyle(.textAccentW)
                } icon: {}
                    .frame(width: 120)
                Spacer()
                ZStack(alignment: .trailing) {
                    MyFinanceCustomTextField(text: self.$model.searchText, placeholder: Constants.placeholderTypeHere, type: .normal, radius: 25, height: 40)
                        .frame(width: self.model.offsetSearchButton - 10)
                    Button {
                        self.model.expandSearchBar()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(height: 40)
                                .foregroundStyle(.textField)
                            Image(systemName: self.model.searchButtonIcon)
                                .foregroundStyle(.textAccentW)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
    private var accountCardScroller: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 12) {
                ForEach(0..<3, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 36)
                        .frame(width: 140, height: 160)
                        .foregroundStyle(.primaryButton.gradient)
                }
            }
        }
        .scrollIndicators(.hidden)
        .safeAreaPadding(.horizontal, 16)
    }
    private var financeCardScroller: some View {
        VStack(alignment: .leading) {
            Label {
                Text(Constants.homeFinanceLabel)
                    .foregroundStyle(.textAccentW)
            } icon: {
                
            }
            .padding(.horizontal, 16)
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(0..<4, id: \.self) { _ in
                        ZStack {
                            RoundedRectangle(cornerRadius: 32)
                                .frame(width: 100, height: 100)
                                .foregroundStyle(.secondaryButton)
                            VStack {
                                HStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .frame(width: 40, height: 40)
                                        .foregroundStyle(.primaryButton)
                                    Spacer()
                                }
                                Spacer()
                            }
                            .padding(16)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .safeAreaPadding(.horizontal, 16)
        }
    }
    var assetsAndLiabilities: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.secondaryButton)
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    ExpandableView(isExpanded: self.$model.isLoansExpanded, label: Constants.homeCurrentLoansLabel) {
                        ForEach(self.model.assetItems) { asset in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(height: 60)
                                    .foregroundStyle(.textField)
                                HStack {
                                    Text(asset.name ?? Constants.emptyString)
                                        .foregroundStyle(.textAccentW)
                                    Spacer()
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                    ExpandableView(isExpanded: self.$model.isCurrenciesExpanded, label: Constants.homeCurrenciesAndMetalsLabel) {
                        ForEach(self.model.assetItems) { asset in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(height: 60)
                                    .foregroundStyle(.textField)
                                HStack {
                                    Text(asset.name ?? Constants.emptyString)
                                        .foregroundStyle(.textAccentW)
                                    Spacer()
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                }
            }
            .padding(32)
        }
        .padding(.horizontal, 16)
    }
}
