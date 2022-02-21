//
//  AppRouter.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/5/21.
//

import UIKit

extension UIStoryboard {
    enum Storyboard: String {
        case login = "Login"
        case profile = "Profile"
        case register = "Register"
        case settings = "Settings"
        case forgotPassword = "ForgotPassword"
        case liveRadio = "LiveRadio"
        case sideMenu = "SideMenu"
        case iTestify = "iTestify"
        case giving = "Giving"
        case home = "Home"
        case allSeries = "AllSeries"
        case yearlyPlaylist = "YearlyPlaylist"
        case downloads = "Downloads"
        case myPlaylist = "MyPlaylist"
        case favourite = "Favourite"
        case allMessages = "AllMessages"
    }
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
    
    func createVC<VC: UIViewController>() -> VC {
        guard let viewController = instantiateViewController(withIdentifier: VC.identifier) as? VC else {
            fatalError("Couldn't instantiate view controller with identifier \(VC.identifier) ")
        }
        return viewController
    }
}
