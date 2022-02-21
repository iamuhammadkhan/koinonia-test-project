//
//  UIView+Extension.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/5/21.
//

import UIKit

extension UIView {
    func roundedCorners() {
        layer.cornerRadius = frame.height / 2
    }
    
    func applyShadow() {
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.4
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    func findConstraint(layoutAttribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        if layoutAttribute == .height || layoutAttribute == .width {
            return layoutAttribute == .height ? self.heightConstaint : self.widthConstaint
        } else if let constraints = superview?.constraints {
            for constraint in constraints where itemMatch(constraint: constraint, layoutAttribute: layoutAttribute) {
                return constraint
            }
        }
        if let superview = self.superview {
            return superview.findConstraint(layoutAttribute: .bottom)
        }
        return nil
    }
    
    ///Matching constraint attribte with respect to view.
    private func itemMatch(constraint: NSLayoutConstraint, layoutAttribute: NSLayoutConstraint.Attribute) -> Bool {
        if let firstItem = constraint.firstItem as? UIView, let secondItem = constraint.secondItem as? UIView {
            let firstItemMatch = firstItem == self && constraint.firstAttribute == layoutAttribute
            let secondItemMatch = secondItem == self && constraint.secondAttribute == layoutAttribute
            return firstItemMatch || secondItemMatch
        }
        return false
    }
    
    private var heightConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .height && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
    private var widthConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .width && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
}
