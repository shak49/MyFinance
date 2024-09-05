//
//  InitialView.swift
//  MyFinance
//
//  Created by Shak Feizi on 8/31/24.
//

import SwiftUI

struct InitialView: View {
    // MARK: - Properties
    @EnvironmentObject var router: Router
    
    // MARK: - Body
    var body: some View {
        VStack {
            Image(.logo)
                .resizable()
                .frame(width: 240, height: 240)
            VStack(spacing: 15) {
                Button {
                    router.navigateTo(screen: .signInView)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .foregroundColor(.primaryButton)
                        Text("Sign In")
                            .foregroundStyle(.textAccentB)
                    }
                    .frame(height: 50)
                }
                Button {
                    router.navigateTo(screen: .signUpView)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .foregroundColor(.secondaryButton)
                        Text("Create An Account")
                            .foregroundStyle(.textAccentW)
                    }
                    .frame(height: 50)
                }
            }
        }
        .padding(.horizontal, 32)
    }
}

#Preview {
    InitialView()
}

