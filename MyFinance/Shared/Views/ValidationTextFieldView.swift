//
//  ValidationTextFieldView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/5/24.
//

import SwiftUI

struct ValidationTextFieldView: View {
    // MARK: - Properties
    private let field: Binding<FieldModel>
    private let radius: Double
    private let height: Double
    private let onChange: () -> Void?
    @FocusState private var isVisible: Bool
    
    // MARK: - Lifecycle
    init(field: Binding<FieldModel>, radius: Double = 10, height: Double = 50, onChange: @escaping () -> Void?) {
        self.field = field
        self.radius = radius
        self.height = height
        self.onChange = onChange
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if self.field.type.wrappedValue == .email {
                TextField(text: .constant(self.field.value.wrappedValue ?? "")) {
                    Text(self.field.type.wrappedValue.placeholder)
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal, 10)
                .textInputAutocapitalization(.never)
                .frame(height: self.height)
                .background(.textField)
                .opacity(0.7)
                .shadow(color: .black.opacity(0.3), radius: 4, x: -4, y: -4)
                .shadow(color: .black, radius: 4, x: 4, y: 4)
                .foregroundStyle(.textAccentW)
                .cornerRadius(self.radius)
                .onSubmit(of: .text) { self.onChange() }
            } else {
                SecureField(text: .constant(self.field.value.wrappedValue ?? "")) {
                    HStack {
                        Text(self.field.type.wrappedValue.placeholder)
                        Button {
                            self.isVisible.toggle()
                        } label: {
                            Image(self.isVisible ? "eye" : "eye.slash")
                                .resizable()
                                .frame(width: 12, height: 12)
                        }
                    }
                    .foregroundStyle(.gray)
                }
                .padding(.horizontal, 10)
                .frame(height: self.height)
                .foregroundStyle(.textAccentW)
                .background(.textField)
                .opacity(0.7)
                .shadow(color: .black.opacity(0.5), radius: 4, x: -4, y: -4)
                .shadow(color: .black, radius: 4, x: 4, y: 4)
                .foregroundStyle(.textAccentW)
                .cornerRadius(self.radius)
                .focused(self.$isVisible)
                .onSubmit(of: .text) { self.onChange() }
            }
            Text(self.field.error.wrappedValue ?? "")
                .foregroundStyle(.red)
                .font(.system(size: 14))
                .padding(.horizontal, 6)
        }
    }
}
