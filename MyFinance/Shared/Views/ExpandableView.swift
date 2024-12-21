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
    let content: () -> Content
    
    var body: some View {
        Section(isExpanded: self.$isExpanded) {
            if self.isExpanded {
                self.content()
            }
        } header: {
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
        }
    }
}

#Preview {
    ExpandableView(isExpanded: .constant(false), label: "Title") { AnyView {} }
}
