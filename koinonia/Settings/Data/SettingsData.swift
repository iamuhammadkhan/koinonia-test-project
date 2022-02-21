//
//  SettingsData.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/9/21.
//

import UIKit

enum SettingsType {
    case theme, notifications, rateApp, shareApp, moreApps, privacyPolicy, aboutUs
}

struct SettingsData {
    let title: String
    let image: UIImage?
    let subTitle: String?
    let hasSwitch: Bool
    let hasImage: Bool
    let type: SettingsType
}

final class SettingsDataProvider {
    private lazy var data = [SettingsData]()
    
    func generateData() -> [SettingsData] {
        data = [SettingsData(title: "Theme", image: #imageLiteral(resourceName: "mode_icon"), subTitle: "Light", hasSwitch: false, hasImage: true, type: .theme),
                SettingsData(title: "Enable Push Notification", image: nil, subTitle: nil, hasSwitch: true, hasImage: false, type: .notifications),
                SettingsData(title: "Rate App", image: nil, subTitle: nil, hasSwitch: false, hasImage: false, type: .rateApp),
                SettingsData(title: "Share App", image: nil, subTitle: nil, hasSwitch: false, hasImage: false, type: .shareApp),
                SettingsData(title: "More Apps", image: nil, subTitle: nil, hasSwitch: false, hasImage: false, type: .moreApps),
                SettingsData(title: "Privacy Policy", image: nil, subTitle: nil, hasSwitch: false, hasImage: false, type: .privacyPolicy),
                SettingsData(title: "About Us", image: nil, subTitle: nil, hasSwitch: false, hasImage: false, type: .aboutUs)]
        return data
    }
}
