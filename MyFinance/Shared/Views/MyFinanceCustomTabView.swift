//
//  MyFinanceCustomTabView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/27/24.
//

import SwiftUI

struct MyFinanceCustomTabView: View {
    // MARK: - Properties
    @Binding var selectedTab: Tab
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: self.$selectedTab) {
                HomeView()
                    .tag(Tab.home)
                WalletView()
                    .tag(Tab.wallet)
                MessagingView()
                    .tag(Tab.messaging)
            }
            TabButtonView(selectedTab: self.$selectedTab)
                .padding(.horizontal, 16)
                .padding(.vertical, 2)
        }
    }
}

#Preview {
    MyFinanceCustomTabView(selectedTab: .constant(.home))
}

struct TabButtonView: View {
    // MARK: - Properties
    @Binding var selectedTab: Tab
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: "house")
                .foregroundStyle(self.selectedTab == .home ? .primaryButton : .textAccentW)
                .onTapGesture {
                    self.selectedTab = .home
                }
                .padding(.horizontal, 32)
            Spacer()
            Image(systemName: "creditcard")
                .foregroundStyle(self.selectedTab == .wallet ? .primaryButton : .textAccentW)
                .onTapGesture {
                    self.selectedTab =  .wallet
                }
                .padding(.horizontal, 32)
            Spacer()
            Image(systemName: "message")
                .foregroundStyle(self.selectedTab == .messaging ? .primaryButton : .textAccentW)
                .onTapGesture {
                    self.selectedTab =  .messaging
                }
                .padding(.horizontal, 32)
        }
        .frame(width: 300, height: 50)
        .background(.theme)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.6), radius: 5)
    }
}
