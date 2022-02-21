//
//  UIScrollView+Extension.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/5/21.
//

import UIKit

extension UIScrollView {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        next?.touchesBegan(touches, with: event)
    }
    
    var currentPage: Int {
        return Int(round(contentOffset.x / frame.width))
    }
}
