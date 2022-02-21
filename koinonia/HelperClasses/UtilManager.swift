//
//  UtilManager.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/6/21.
//

import UIKit
import SwiftMessages

final class UtilManager: NSObject {
    
    private static var singleton: UtilManager?
    private override init() {}
    
    static var shared: UtilManager {
        if UtilManager.singleton == nil {
            UtilManager.singleton = UtilManager()
        }
        let lock = DispatchQueue(label: "UtilManager")
        return lock.sync {
            return UtilManager.singleton!
        }
    }
    
    func getTextAttributes(color: UIColor, font: UIFont, alignment: NSTextAlignment,
                                 lineHeight: CGFloat, letterSpace: CGFloat) -> [NSAttributedString.Key: Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        paragraphStyle.minimumLineHeight = 16
        let attributes = [ .font: font, .paragraphStyle: paragraphStyle, .foregroundColor: color,
                           .kern: letterSpace ] as [NSAttributedString.Key: Any]
        return attributes
    }
    
    func showValidationError(_ message: String) {
        let validation = MessageView.viewFromNib(layout: .statusLine)
        validation.configureTheme(.error)
        validation.configureContent(title: "", body: message)
        SwiftMessages.show(view: validation)
    }
    
    func showErrorMessage(_ title: String, message: String) {
        let error = MessageView.viewFromNib(layout: .messageView)
        error.configureTheme(.error)
        error.configureContent(title: title, body: message)
        error.button?.isHidden = true
        SwiftMessages.show(view: error)
    }
    
    func showSuccessMessage(_ title: String, message: String) {
        let success = MessageView.viewFromNib(layout: .messageView)
        success.configureTheme(.success)
        success.configureContent(title: title, body: message)
        success.button?.isHidden = true
        SwiftMessages.show(view: success)
    }
}
