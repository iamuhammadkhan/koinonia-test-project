//
//  Validator.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/6/21.
//

import UIKit
import PhoneNumberKit

protocol ErrorProtocol: Error {
    var localizedTitle: String { get }
    var localizedDescription: String { get }
}

protocol FieldErrorProtocol: ErrorProtocol {
    var textField: UITextField { get }
}

struct FieldError: FieldErrorProtocol {
    var localizedTitle: String
    var localizedDescription: String
    var textField: UITextField
    
    init(localizedTitle: String? = "Error", localizedDescription: String, textField: UITextField) {
        self.localizedTitle = localizedTitle!
        self.localizedDescription = localizedDescription
        self.textField = textField
    }
}

final class Validator: NSObject {
    enum Rule {
        case required([UITextField])
        case validEmail(UITextField)
        case password(UITextField)
        case confirm(UITextField, UITextField)
    }
    
    class func validate(rules: Rule...) throws {
        for rule in rules {
            switch rule {
            case let .required(textFields):
                try validateEmptyTextFields(textFields: textFields)
            case let .validEmail(textField):
                try validateEmail(textField: textField)
            case let .password(textField):
                try validatePasswordTextField(textField: textField)
            case let .confirm(textField, confirmTextField):
                try confirmPasswordTextFields(textField: textField, confirmTextField: confirmTextField)
            }
        }
    }
    
    class func validateEmptyTextFields(textFields: [UITextField]) throws {
        for textField in textFields {
            if textField.text!.isEmpty {
                throw FieldError(localizedDescription: "Input fields cannot be empty", textField: textField)
            }
        }
    }
    
    class func validatePasswordTextField(textField: UITextField) throws {
        if textField.text!.count < 8 {
            throw FieldError(localizedDescription: "Password cannot be less then 8 characters", textField: textField)
        }
    }
    
    class func validatePhoneTextField(textField: UITextField) throws {
        let phoneNumberKit = PhoneNumberKit()
        if let text = textField.text, !phoneNumberKit.isValidPhoneNumber(text) {
            throw FieldError(localizedDescription: "Provided phone number is invalid", textField: textField)
        }
    }
    
    class func validateNameTextField(textField: UITextField) throws {
        if textField.text!.count < 3 {
            throw FieldError(localizedDescription: "Provided name is invalid", textField: textField)
        }
    }
    
    class func validateEmail(textField: UITextField) throws {
        let emailRegex = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
        if (textField.text?.range(of: emailRegex, options: .regularExpression) == nil) {
            throw FieldError(localizedDescription: "Email is not correct", textField: textField)
        }
    }
    
    class func confirmPasswordTextFields(textField: UITextField, confirmTextField: UITextField) throws {
        if (textField.text != confirmTextField.text) {
            throw FieldError(localizedDescription: "Password do not match", textField: textField)
        }
    }
}
