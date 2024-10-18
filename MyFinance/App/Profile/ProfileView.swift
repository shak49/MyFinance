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
        ContainerView {
            VStack {
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
                Spacer()
                Text("Welcome \(self.model.fullname)!")
                    .foregroundStyle(.textAccentW)
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileView()
}
