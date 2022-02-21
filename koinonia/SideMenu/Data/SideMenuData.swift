//
//  SideMenuData.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/7/21.
//

import UIKit

enum SideMenuType {
    case home, messages, series, yearlyPlaylist, live, giving, myPlaylist, library, downloads, favourite, itestify, settings, login, logout
}

struct SideMenuData {
    let title: String
    let icon: UIImage
    let type: SideMenuType
}

final class SideMenuDataProvider {
    private lazy var data = [SideMenuData]()
    
    func generateData() -> [SideMenuData] {
        data = [SideMenuData(title: "Home", icon: #imageLiteral(resourceName: "home"), type: .home),
                SideMenuData(title: "All Messages", icon: #imageLiteral(resourceName: "all_songs"), type: .messages),
                SideMenuData(title: "All Series", icon: #imageLiteral(resourceName: "albums"), type: .series),
                SideMenuData(title: "Yearly Playlist", icon: #imageLiteral(resourceName: "playlist"), type: .yearlyPlaylist),
                SideMenuData(title: "Live", icon: #imageLiteral(resourceName: "email"), type: .live),
                SideMenuData(title: "Giving", icon: #imageLiteral(resourceName: "password"), type: .giving),
                SideMenuData(title: "My Playlist", icon: #imageLiteral(resourceName: "myplay"), type: .myPlaylist),
                SideMenuData(title: "Library", icon: #imageLiteral(resourceName: "music_lib_grey"), type: .library),
                SideMenuData(title: "Downloads", icon: #imageLiteral(resourceName: "download"), type: .downloads),
                SideMenuData(title: "Favourite", icon: #imageLiteral(resourceName: "favourite"), type: .favourite),
                SideMenuData(title: "iTestify", icon: #imageLiteral(resourceName: "email"), type: .itestify),
                SideMenuData(title: "Settings", icon: #imageLiteral(resourceName: "settings"), type: .settings),
                SideMenuData(title: "Login", icon: #imageLiteral(resourceName: "login"), type: .login)]
        return data
    }
}
