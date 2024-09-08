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
    private let content: Content
    @State var isDisabled: Bool = false
    
    // MARK: - Lifecycles
    init(isLoading: Bool? = false, content: @escaping () -> Content) {
        self.isLoading = isLoading
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
            // Toast
            
            // Alert
            
        }
    }
}
