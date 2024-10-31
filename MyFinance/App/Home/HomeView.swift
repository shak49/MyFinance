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
            VStack {
                HStack {
                    Button {
                        self.router.navigateTo(screen: .profile)
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 40)
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
                .frame(width: 360)
                Spacer()
                Text("Welcome to Home screen!")
                    .foregroundStyle(.textAccentW)
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
