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
    private let alert: (type: AlertType, isPresented: Bool)
    private let content: Content
    @State private var isDisabled: Bool = false
    
    // MARK: - Lifecycles
    init(isLoading: Bool? = false, alert: (type: AlertType, isPresented: Bool) = (.unableToProceed, false), content: @escaping () -> Content) {
        self.isLoading = isLoading
        self.alert = alert
        self.content = content()
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            if let isLoading = self.isLoading, isLoading {
                ProgressView()
                    .scaleEffect(1.5)
                    .tint(.primaryButton)
                    .onAppear {
                        self.isDisabled = true
                    }
            }
            self.content
                .disabled(self.isDisabled)
        }
        // Alert
        .alert(isPresented: .constant(self.alert.isPresented)) {
            self.alert.type.show
        }
        // Toast
        
    }
}
