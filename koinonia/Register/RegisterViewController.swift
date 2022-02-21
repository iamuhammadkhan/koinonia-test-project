//
//  RegisterViewController.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/5/21.
//

import UIKit

final class RegisterViewController: UIViewController {

    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var phoneNumberTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        UITextField.connectFields(fields: [nameTextField, emailTextField, passwordTextField, confirmPasswordTextField, phoneNumberTextField])
        let attributes1 = UtilManager.shared.getTextAttributes(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), font: UIFont(name: "Poppins-Regular", size: 15)!, alignment: .left, lineHeight: 16, letterSpace: -0.4)
        let attributes2 = UtilManager.shared.getTextAttributes(color: #colorLiteral(red: 0.2823529412, green: 0.1725490196, blue: 0.462745098, alpha: 1), font: UIFont(name: "Poppins-Regular", size: 15)!, alignment: .left, lineHeight: 16, letterSpace: -0.4)
        let attributedString = NSMutableAttributedString(string: "Already have an account? ", attributes: attributes1)
        let lastAttributedString = NSAttributedString(string: "Login", attributes: attributes2)
        attributedString.append(lastAttributedString)
        loginButton.setAttributedTitle(attributedString, for: .normal)
    }
    
    private func performRegistration() {
        
    }
    
    @IBAction private func registerTapped( _ sender: UIButton) {
        do {
            try Validator.validateEmptyTextFields(textFields: [nameTextField, emailTextField, passwordTextField, confirmPasswordTextField, phoneNumberTextField])
            try Validator.validateNameTextField(textField: nameTextField)
            try Validator.validateEmail(textField: emailTextField)
            try Validator.validatePasswordTextField(textField: passwordTextField)
            try Validator.confirmPasswordTextFields(textField: passwordTextField, confirmTextField: confirmPasswordTextField)
            try Validator.validatePhoneTextField(textField: phoneNumberTextField)
            performRegistration()
        } catch {
            if let error = error as? FieldError {
                UtilManager.shared.showValidationError(error.localizedDescription)
            }
        }
    }

    @IBAction private func loginTapped( _ sender: UIButton) {
        dismiss(animated: true)
    }
}
