//
//  LoginViewController.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/5/21.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet private weak var signupButton: UIButton!
    @IBOutlet private weak var welcomeTitleLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var rememberMeImageView: UIImageView!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var rememberMeButton: UIButton!
    @IBOutlet private weak var welcomeTextLabel: UILabel!
    
    private lazy var rememberMe = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        UITextField.connectFields(fields: [emailTextField, passwordTextField])
        let attributes1 = UtilManager.shared.getTextAttributes(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), font: UIFont(name: "Poppins-Regular", size: 15)!, alignment: .left, lineHeight: 16, letterSpace: -0.4)
        let attributes2 = UtilManager.shared.getTextAttributes(color: #colorLiteral(red: 0.2823529412, green: 0.1725490196, blue: 0.462745098, alpha: 1), font: UIFont(name: "Poppins-Regular", size: 15)!, alignment: .left, lineHeight: 16, letterSpace: -0.4)
        let attributedString = NSMutableAttributedString(string: "Don't have an account? ", attributes: attributes1)
        let lastAttributedString = NSAttributedString(string: "Sign Up", attributes: attributes2)
        attributedString.append(lastAttributedString)
        signupButton.setAttributedTitle(attributedString, for: .normal)
    }
    
    private func performLogin() {
        
    }
    
    @IBAction private func rememberMeTapped( _ sender: UIButton) {
        if rememberMe {
            rememberMeImageView.image = #imageLiteral(resourceName: "uncheck")
            rememberMeImageView.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            rememberMe = false
        } else {
            rememberMeImageView.image = #imageLiteral(resourceName: "check")
            rememberMeImageView.tintColor = #colorLiteral(red: 0.8588235294, green: 0.2666666667, blue: 0.2156862745, alpha: 1)
            rememberMe = true
        }
    }
    
    @IBAction private func loginTapped( _ sender: UIButton) {
        do {
            try Validator.validateEmptyTextFields(textFields: [emailTextField, passwordTextField])
            try Validator.validateEmail(textField: emailTextField)
            try Validator.validatePasswordTextField(textField: passwordTextField)
            performLogin()
        } catch {
            if let error = error as? FieldError {
                UtilManager.shared.showValidationError(error.localizedDescription)
            }
        }
    }
    
    @IBAction private func skipTapped( _ sender: UIButton) {
        let vc: HomeViewController = UIStoryboard(storyboard: .home).createVC()
        let navigation = UINavigationController(rootViewController: vc)
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true)
    }
    
    @IBAction private func forgotPasswordTapped( _ sender: UIButton) {
        let vc: ForgotPasswordViewController = UIStoryboard(storyboard: .forgotPassword).createVC()
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction private func loginWithFBTapped( _ sender: UIButton) {
        
    }
    
    @IBAction private func loginWithGoogleTapped( _ sender: UIButton) {
        
    }
    
    @IBAction private func signupTapped( _ sender: UIButton) {
        let vc: RegisterViewController = UIStoryboard(storyboard: .register).createVC()
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
