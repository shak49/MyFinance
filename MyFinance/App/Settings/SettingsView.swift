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
            NavigationStack {
                Text("Hello, World!")
                    .foregroundStyle(.textAccentW)
                    .toolbar {
                        HStack {
                            Spacer()
                            Button {
                                self.model.preformSignOut()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(height: 40)
                                        .foregroundStyle(.white)
                                    Text("Sign Out")
                                        .foregroundStyle(.red)
                                        .padding(.horizontal, 8)
                                }
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.red, lineWidth: 2)
                                }
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    SettingsView()
}
