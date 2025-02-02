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
            VStack(spacing: 8) {
                self.toolbar
                VStack(spacing: 8) {
                    self.profileHeader
                    self.profileSettingSection
                }
                .padding(.horizontal, 16)
                .padding(.top, 32)
            }
        }
    }
}

#Preview {
    ProfileView()
}

extension ProfileView {
    private var toolbar: some View {
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
    }
    private var profileHeader: some View {
        HStack {
            Circle()
                .stroke(.primaryButton, lineWidth: 3)
                .fill(Color(hex: self.model.userProfile?.avator ?? Constants.emptyString))
                .frame(height: 140)
            Spacer()
            Text(self.model.userProfile?.fullname ?? Constants.emptyString)
                .foregroundStyle(.textAccentW)
                .font(.system(size: 24))
            Spacer()
        }
    }
    private var profileSettingSection: some View {
        Section {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.secondaryButton)
                VStack(spacing: 16) {
                    HStack {
                        Text("Add an account")
                            .font(.system(size: 20))
                            .foregroundStyle(.textAccentW)
                        Spacer()
                        Button {
                            
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
                    Divider()
                        .frame(height: 4)
                        .background(.theme)
                    HStack {
                        Text("Title")
                            .font(.system(size: 20))
                            .foregroundStyle(.textAccentW)
                        Spacer()
                        Button {
                            
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(width: 30)
                                    .foregroundStyle(.theme)
                                Image(systemName: "play")
                                    .foregroundStyle(.primaryButton)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    Divider()
                        .frame(height: 4)
                        .background(.theme)
                    Spacer()
                }
                .padding(.vertical, 20)
            }
            Spacer()
        } header: {
            Text("")
        }
    }
}
