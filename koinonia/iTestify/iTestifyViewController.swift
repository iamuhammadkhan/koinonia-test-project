//
//  iTestifyViewController.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/8/21.
//

import UIKit

final class iTestifyViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var titleContainerView: UIView!
    @IBOutlet private weak var descriptionContainerView: UIView!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var imageContainerView: UIView!
    @IBOutlet private weak var titleTextView: UITextView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageLabel: UILabel!

    private let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        containerView.applyShadow()
        titleTextView.delegate = self
        descriptionTextView.delegate = self
        titleContainerView.layer.borderWidth = 2
        titleContainerView.layer.borderColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        titleContainerView.layer.cornerRadius = 6
        navigationController?.navigationBar.makeNavBarPurple()
        descriptionContainerView.layer.borderWidth = 2
        descriptionContainerView.layer.borderColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        descriptionContainerView.layer.cornerRadius = 6
        imageContainerView.layer.borderColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        imageContainerView.layer.cornerRadius = 6
        imageContainerView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 6
        navigationItem.title = "iTestify"
        imagePicker.delegate = self
    }
    
    @objc private func handleTextView( _ sender: UITextView) {
        print(sender.text ?? "Its empty")
    }
    
    @IBAction func selectImageTapped( _ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    @IBAction func submitTapped( _ sender: UIButton) {
        
    }
}

extension iTestifyViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.tag == 1 {
            if textView.text == "" || textView.text == "Testimony title" {
                textView.text = "Testimony title"
                textView.textColor = .lightGray
            }
        } else if textView.tag == 2 {
            if textView.text == "" || textView.text == "Write your testimony" {
                textView.text = "Write your testimony"
                textView.textColor = .lightGray
            }
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.tag == 1 {
            if textView.text == "" || textView.text == "Testimony title" {
                textView.textColor = .black
                textView.text = ""
            }
        } else if textView.tag == 2 {
            if textView.text == "" || textView.text == "Write your testimony" {
                textView.textColor = .black
                textView.text = ""
            }
        }
    }
}

extension iTestifyViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = pickedImage
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
