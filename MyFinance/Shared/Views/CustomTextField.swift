//
//  BasicTextField.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/16/24.
//

import SwiftUI

enum FieldType {
    case normal
    case email
    case password
}

struct CustomTextField: View {
    // MARK: - Properties
    private let name: Binding<String>
    private let placeholder: String
    private let type: FieldType
    private let radius: Double
    private let height: Double
    @State var isVisible: Bool = false
    
    // MARK: - Lifecycles
    init(name: Binding<String>, placeholder: String, type: FieldType, radius: Double = 10, height: Double = 50) {
        self.name = name
        self.placeholder = placeholder
        self.type = type
        self.radius = radius
        self.height = height
    }
    
    // MARK: - Body
    var body: some View {
        if self.type == .password {
            ZStack {
                if self.isVisible {
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
                } else {
                    SecureField(text: self.name) {
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
                HStack {
                    Spacer()
                    Button {
                        self.isVisible.toggle()
                    } label: {
                        Image(systemName: self.isVisible ? "eye" : "eye.slash")
                            .foregroundStyle(.gray)
                            .padding(.horizontal, 8)
                    }
                }
            }
        } else {
            TextField(text: self.name) {
                Text(self.placeholder)
                    .foregroundStyle(.gray)
            }
            .textInputAutocapitalization(self.type == .email ? .never : .sentences)
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
}
