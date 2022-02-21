//
//  UIApplication+Extension.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/7/21.
//

import UIKit
import JGProgressHUD

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    class func startActivityIndicator(with message: String? = "") {
        let hud = JGProgressHUD(style: .dark)
        hud.tag = 999
        hud.textLabel.text = message
        if let topVC = UIApplication.topViewController() {
            DispatchQueue.main.async {
                hud.show(in: topVC.view)
            }
        }
    }
        
    class func stopActivityIndicator() {
        if let hud = UIApplication.topViewController()?.view.viewWithTag(999) as? JGProgressHUD {
            DispatchQueue.main.async {
                hud.dismiss()
                hud.removeFromSuperview()
            }
        }
    }
}
