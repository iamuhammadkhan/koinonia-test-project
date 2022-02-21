//
//  HomeViewController.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/7/21.
//

import UIKit
import SideMenu

final class HomeViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: HomeBannerTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HomeBannerTableViewCell.identifier)
        navigationController?.navigationBar.makeNavBarPurple()
        navigationItem.modifyBackButton()
    }
    
    @IBAction private func searchTapped( _ sender: UIBarButtonItem) {
        
    }
    
    @IBAction private func sideMenuTapped( _ sender: UIBarButtonItem) {
        let vc: SideMenuViewController = UIStoryboard(storyboard: .sideMenu).createVC()
        let menu = SideMenuNavigationController(rootViewController: vc)
        menu.menuWidth = view.frame.width - 100
        menu.presentationStyle = .menuSlideIn
        menu.leftSide = true
        vc.delegate = self
        present(menu, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeBannerTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}

extension HomeViewController: SideMenuDelegate {
    func subMenuTapped(_ data: SideMenuData) {
        switch data.type {
        case .giving:
            let vc: GivingViewController = UIStoryboard(storyboard: .giving).createVC()
            navigationController?.pushViewController(vc, animated: true)
        case .live:
            let vc: LiveRadioViewController = UIStoryboard(storyboard: .liveRadio).createVC()
            navigationController?.pushViewController(vc, animated: true)
        case .itestify:
            let vc: iTestifyViewController = UIStoryboard(storyboard: .iTestify).createVC()
            navigationController?.pushViewController(vc, animated: true)
        case .settings:
            let vc: SettingsViewController = UIStoryboard(storyboard: .settings).createVC()
            navigationController?.pushViewController(vc, animated: true)
        case .series:
            let vc: AllSeriesViewController = UIStoryboard(storyboard: .allSeries).createVC()
            navigationController?.pushViewController(vc, animated: true)
        case .yearlyPlaylist:
            let vc: YearlyPlaylistViewController = UIStoryboard(storyboard: .yearlyPlaylist).createVC()
            navigationController?.pushViewController(vc, animated: true)
        case .downloads:
            let vc: DownloadsViewController = UIStoryboard(storyboard: .downloads).createVC()
            navigationController?.pushViewController(vc, animated: true)
        case .favourite:
            let vc: FavouriteViewController = UIStoryboard(storyboard: .favourite).createVC()
            navigationController?.pushViewController(vc, animated: true)
        case .myPlaylist:
            let vc: MyPlaylistViewController = UIStoryboard(storyboard: .myPlaylist).createVC()
            navigationController?.pushViewController(vc, animated: true)
        case .messages:
            let vc: AllMessagesViewController = UIStoryboard(storyboard: .allMessages).createVC()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
