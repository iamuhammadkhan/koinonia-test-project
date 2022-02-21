//
//  BorderedButton.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/6/21.
//

import UIKit

final class BorderedButton: UIButton {
    @IBInspectable var textColor: UIColor = UIColor.white {
        didSet {
            updateViews()
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet { updateViews() }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet { updateViews() }
    }
    
    @IBInspectable var background: UIColor = UIColor.clear {
        didSet { updateViews() }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet { updateViews() }
    }
    
    private func updateViews() {
        backgroundColor = background
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
        setTitleColor(textColor, for: .normal)
        layer.borderWidth = borderWidth
    }
}
