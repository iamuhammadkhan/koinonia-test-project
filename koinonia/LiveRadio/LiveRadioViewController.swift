//
//  LiveRadioViewController.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/8/21.
//

import UIKit
import WebKit

final class LiveRadioViewController: UIViewController {

    @IBOutlet private weak var webView: WKWebView!
    
    private let urlString = "https://mixlr.com/koinonia-radio"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        navigationController?.navigationBar.makeNavBarPurple()
        navigationItem.title = "Live"
        if let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
}
