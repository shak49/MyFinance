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

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
