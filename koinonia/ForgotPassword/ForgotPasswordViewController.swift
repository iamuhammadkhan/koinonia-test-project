//
//  ForgotPasswordViewController.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/5/21.
//

import UIKit

final class ForgotPasswordViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var pageTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        UITextField.connectFields(fields: [emailTextField])
    }
    
    private func sendResetLink() {
        
    }

    @IBAction private func backTapped( _ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction private func sendTapped( _ sender: UIButton) {
        do {
            try Validator.validateEmptyTextFields(textFields: [emailTextField])
            try Validator.validateEmail(textField: emailTextField)
            sendResetLink()
        } catch {
            if let error = error as? FieldError {
                UtilManager.shared.showValidationError(error.localizedDescription)
            }
        }
    }
}
