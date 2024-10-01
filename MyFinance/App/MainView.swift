//
//  MainView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/7/24.
//

import SwiftUI

struct MainView: View {
    // MARK: - Properties
    @State private var tab: Tab = .home
    
    // MARK: - Lifecycles
    
    // MARK: - Body
    var body: some View {
        CustomTabView(selectedTab: self.$tab)
    }
}

#Preview {
    MainView()
}
