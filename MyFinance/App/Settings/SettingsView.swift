//
//  SettingsView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/7/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    @StateObject var model = SettingsVM()
    
    // MARK: - Body
    var body: some View {
        ContainerView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.textAccentW)
        }
    }
}

#Preview {
    SettingsView()
}
