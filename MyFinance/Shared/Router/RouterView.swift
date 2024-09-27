//
//  RouterView.swift
//  MyFinance
//
//  Created by Shak Feizi on 8/31/24.
//

import SwiftUI

struct RouterView<Content: View>: View {
    // MARK: - Properties
    @StateObject private var router = Router()
    private let content: Content
    
    // MARK: - Lifecycles
    init(content: @escaping () -> Content) {
        self.content = content()
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: self.$router.path) {
            self.content
                .navigationDestination(for: Screen.self) { destination in
                    self.router.view(screen: destination)
                        .background(.theme)
                }
        }
        .environmentObject(self.router)
    }
}
