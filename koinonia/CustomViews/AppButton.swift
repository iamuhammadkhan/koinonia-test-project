//
//  AppButton.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/6/21.
//

import UIKit

final class AppButton: UIButton {
    @IBInspectable var textColor: UIColor = UIColor.white {
        didSet {
            updateViews()
        }
    }
    
    @IBInspectable var background: UIColor = UIColor.white {
        didSet {
            updateViews()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        backgroundColor = background
        layer.cornerRadius = cornerRadius
        setTitleColor(textColor, for: .normal)
    }
}
