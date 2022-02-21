//
//  ProfileViewController.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/9/21.
//

import UIKit

final class ProfileViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var phoneLabel: UILabel!
    
    private let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        containerView.applyShadow()
        navigationItem.title = "Profile"
        navigationController?.navigationBar.makeNavBarPurple()
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        profileImageView.addGestureRecognizer(tap)
    }
    
    @objc private func imageTapped( _ sender: UITapGestureRecognizer) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageView.contentMode = .scaleAspectFill
            profileImageView.clipsToBounds = true
            profileImageView.image = pickedImage
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
