//
//  GivingViewController.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/8/21.
//

import UIKit

final class GivingViewController: UIViewController {

    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        containerView.applyShadow()
        navigationController?.navigationBar.makeNavBarPurple()
        navigationItem.title = "Giving"
    }
}
