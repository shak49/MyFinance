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
    
    // MARK: - Lifecycles
    init(isLoading: Bool? = nil, content: @escaping () -> Content) {
        self.isLoading = isLoading
        self.content = content()
    }
    
    // MARK: - Body
    var body: some View {
        if let isLoading {
            ProgressView()
        } else {
            self.content
        }
    }
}
