//
//  SettingsView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/7/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    @EnvironmentObject var router: Router
    @StateObject var model = SettingsVM()
    
    // MARK: - Body
    var body: some View {
        ContainerView {
            Text("Hello, World!")
                .foregroundStyle(.textAccentW)
        }
    }
}

#Preview {
    SettingsView()
}
