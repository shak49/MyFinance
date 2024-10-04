//
//  ToastView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/20/24.
//

import SwiftUI

struct ToastView: View {
    // MARK: - Properties
    @EnvironmentObject private var router: Router
    var toast: Toast
    
    // MARK: - Lifecycles
    
    // MARK: - Body
    var body: some View {
        Button {
            if self.toast.type == .newFeature {
                self.router.navigateTo(screen: .newFeature)
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.theme)
                HStack {
                    Text(self.toast.message ?? Constants.emptyString)
                        .foregroundStyle(self.toast.color)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName: self.toast.icon)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(self.toast.color)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(self.toast.color, lineWidth: 2)
            }
        }
        .frame(width: 300, height: 70)
        .transition(.move(edge: .top))
        .animation(.easeIn(duration: 3))
        .padding(.top, 64)
        Spacer()
    }
}
