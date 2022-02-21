//
//  UINavigationBar+Extension.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/5/21.
//

import UIKit

extension UINavigationBar {
    func makeTransparent() {
        shadowImage = UIImage()
        setBackgroundImage(UIImage(), for: .default)
    }
    
    func makeNonTransparent() {
        shadowImage = UIImage()
        setBackgroundImage(nil, for: .default)
    }
    
    func makeNavBarClear() {
        barTintColor = .clear
        backgroundColor = .clear
        tintColor = .white
    }

    func makeNavBarDark() {
        barTintColor = .black
        backgroundColor = .black
        tintColor = .white
    }
    
    func makeNavBarPurple() {
        titleTextAttributes = [.foregroundColor: UIColor.white]
        backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.1725490196, blue: 0.462745098, alpha: 1)
        barTintColor = #colorLiteral(red: 0.2823529412, green: 0.1725490196, blue: 0.462745098, alpha: 1)
        tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func addCustomBackgroundImage(_ named: String) {
        shadowImage = UIImage()
        setBackgroundImage(UIImage(named: named), for: .default)
    }
    
    func setTitleAppearance() {
//        let attributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().titleTextAttributes = attributes
    }
}
