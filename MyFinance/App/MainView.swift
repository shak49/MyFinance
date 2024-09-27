//
//  MainView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/7/24.
//

import SwiftUI

struct MainView: View {
    // MARK: - Properties
    @State private var index = 0
    
    // MARK: - Lifecycles
    
    // MARK: - Body
    var body: some View {
        TabView(selection: self.$index) {
            HomeView()
                .tabItem {
                    Label(
                        title: {
                            Text("Home")
                                .foregroundStyle(.textAccentW)
                        },
                        icon: {
                            Image(systemName: "house")
                                .foregroundStyle(.textAccentW)
                        }
                    )
                }
                .tag(self.index)
            SettingsView()
                .tabItem {
                    Label(
                        title: {
                            Text("Settings")
                                .foregroundStyle(.textAccentW)
                        },
                        icon: {
                            Image(systemName: "gear")
                                .foregroundStyle(.textAccentW)
                        }
                    )
                }
                .tag(self.index)
        }
        .background(.secondaryButton)
    }
}

#Preview {
    MainView()
}
