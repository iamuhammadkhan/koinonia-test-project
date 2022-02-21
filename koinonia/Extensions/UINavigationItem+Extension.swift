//
//  UINavigationItem+Extension.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/5/21.
//

import UIKit

extension UINavigationItem {
    func modifyBackButton() {
        backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func addLogo(_ named: String) {
        let imageView = UIImageView(image: UIImage(named: named))
        imageView.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        imageView.contentMode = .scaleAspectFit
        titleView = imageView
    }
}
