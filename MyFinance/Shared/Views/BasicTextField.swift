//
//  BasicTextField.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/16/24.
//

import SwiftUI

struct BasicTextField: View {
    // MARK: - Properties
    private let name: Binding<String>
    private let placeholder: String
    private let radius: Double
    private let height: Double
    
    // MARK: - Lifecycles
    init(name: Binding<String>, placeholder: String, radius: Double = 10, height: Double = 50) {
        self.name = name
        self.placeholder = placeholder
        self.radius = radius
        self.height = height
    }
    
    // MARK: - Body
    var body: some View {
        TextField(text: self.name) {
            Text(self.placeholder)
                .foregroundStyle(.gray)
        }
        .padding(.horizontal, 10)
        .frame(height: self.height)
        .background(.textField)
        .opacity(0.7)
        .shadow(color: .black.opacity(0.3), radius: 2, x: -2, y: -2)
        .shadow(color: .black, radius: 2, x: 2, y: 2)
        .foregroundStyle(.textAccentW)
        .cornerRadius(self.radius)
    }
}
