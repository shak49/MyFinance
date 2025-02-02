//
//  ExpandableView.swift
//  MyFinance
//
//  Created by Shak Feizi on 12/20/24.
//

import SwiftUI

struct ExpandableView<Content: View>: View {
    @Binding var isExpanded: Bool
    let label: String
    let action: (() -> Void)?
    let content: () -> Content
    
    init(isExpanded: Binding<Bool>, label: String, action: (() -> Void)? = nil, content: @escaping () -> Content) {
        self._isExpanded = isExpanded
        self.label = label
        self.action = action
        self.content = content
    }
    
    var body: some View {
        Section(isExpanded: self.$isExpanded) {
            if self.isExpanded {
                self.content()
            }
        } header: {
            HStack {
                Button {
                    self.isExpanded.toggle()
                } label: {
                    HStack {
                        Image(systemName: self.isExpanded ? "chevron.up" : "chevron.down")
                        Text(self.label)
                        Spacer()
                    }
                    .foregroundStyle(.textAccentW)
                }
                Spacer()
                if let action = self.action {
                    AnyView { action() }
                }
            }
        }
    }
}

#Preview {
    ExpandableView(isExpanded: .constant(false), label: "Title") { AnyView {} }
}
