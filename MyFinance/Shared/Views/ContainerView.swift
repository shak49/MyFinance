//
//  ContainerView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/4/24.
//

import SwiftUI
import PopupView

struct ContainerView<Content: View>: View {
    // MARK: - Properties
    private let isLoading: Bool?
    private let alert: CustomAlert
    private var toast: Toast
    private let content: Content
    @State private var isDisabled: Bool = false
    
    // MARK: - Lifecycles
    init(isLoading: Bool? = false, alert: CustomAlert = .init(type: .unableToProceed, message: Constants.emptyString, isPresented: false), toast: Toast = Toast(type: .info, isPresented: false), content: @escaping () -> Content) {
        self.isLoading = isLoading
        self.alert = alert
        self.toast = toast
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
            self.alert.display
        }
        // Toast
        .popup(isPresented: .constant(self.toast.isPresented)) {
            ToastView(toast: self.toast)
        } customize: { popedView in
            popedView
                .type(.floater())
                .position(.top)
                .appearFrom(.topSlide)
                .closeOnTapOutside(true)
                .autohideIn(3)
        }
    }
}
