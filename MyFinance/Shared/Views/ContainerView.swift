//
//  ContainerView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/4/24.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    // MARK: - Properties
    private let isLoading: Bool?
    private let alert: Alerts
    private let toast: Toast
    private let sheet: Sheets
    private let content: Content
    @State private var isDisabled: Bool = false
    
    // MARK: - Lifecycles
    init(isLoading: Bool? = false, alert: Alerts = .init(type: .unableToProceed, message: Constants.emptyString, isPresented: false), toast: Toast = Toast(type: .info, isPresented: false), sheet: Sheets = .init(isPresented: false), content: @escaping () -> Content) {
        self.isLoading = isLoading
        self.alert = alert
        self.toast = toast
        self.sheet = sheet
        self.content = content()
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.theme
                .ignoresSafeArea()
            ZStack {
                if let isLoading = self.isLoading, isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .tint(.primaryButton)
                        .onAppear {
                            self.isDisabled = true
                        }
                        .onDisappear {
                            self.isDisabled = false
                        }
                }
                self.content
                    .disabled(self.isDisabled)
            }
            // Alert
            .alert(isPresented: .constant(self.alert.isPresented)) {
                self.alert.display
            }
            // Toast
            
            // Sheet
        }
    }
}
