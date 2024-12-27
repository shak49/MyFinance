//
//  ProfileView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/27/24.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Properties
    @EnvironmentObject var router: Router
    @StateObject var model = ProfileVM()
    
    // MARK: - Body
    var body: some View {
        ContainerView(alert: self.model.alert) {
            VStack(spacing: 32) {
                HStack {
                    Spacer()
                    Button {
                        self.model.preformSignOut(router: self.router)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 80, height: 40)
                                .foregroundStyle(.primaryButton)
                            Text("Sign Out")
                                .foregroundStyle(.textAccentB)
                        }
                    }
                }
                .padding(.horizontal, 16)
                Section {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 50)
                            .foregroundStyle(.secondaryButton)
                        HStack {
                            Text("Add an account")
                                .font(.system(size: 20))
                                .foregroundStyle(.textAccentW)
                            Spacer()
                            Button {
                                self.model.performAddingAccount(router: self.router)
                            } label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 30)
                                        .foregroundStyle(.theme)
                                    Image(systemName: "plus")
                                        .foregroundStyle(.primaryButton)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                } header: {
                    Text("")
                }
                .padding(.horizontal, 16)
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileView()
}
