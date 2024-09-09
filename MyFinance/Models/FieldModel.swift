//
//  FieldModel.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/6/24.
//

import Foundation

protocol FieldValidator {
    func validate(value: String?) -> String?
}

enum FieldType: FieldValidator {
    case email
    case password
    
    var placeholder: String {
        switch self {
        case .email: 
            return Constants.placeholderEmail
        case .password:
            return Constants.placeholderPassword
        }
    }
    
    func validate(value: String?) -> String? {
        guard let value = value else { return nil }
        switch self {
        case .email: 
            return self.emailValidation(value: value)
        case .password:
            return self.passwordValidation(value: value)
        }
    }
    
    private func emailValidation(value: String) -> String? {
        if value.isEmpty {
            return Constants.errorEmptyEmail
        } else {
            let emailRegEx = Constants.emailRegEx
            let predicate = NSPredicate(format: Constants.predicateFormat, emailRegEx)
            let evaluated = predicate.evaluate(with: value)
            return evaluated ? nil : Constants.errorEmail
        }
    }
    
    private func passwordValidation(value: String) -> String? {
        return value.isEmpty ? Constants.errorPassword : nil
    }
}

class FieldModel {
    var value: String?
    var error: String?
    var type: FieldType
    
    init(value: String?, error: String? = nil, type: FieldType) {
        self.value = value
        self.type = type
        self.error = error
    }
    
    func onValidateError() -> Bool {
        self.error = self.type.validate(value: self.value)
        return self.error == nil
    }

    func onSubmitError() {
        self.error = self.type.validate(value: self.value)
    }
}
