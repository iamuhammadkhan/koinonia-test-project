//
//  MyPlaylistViewController.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/9/21.
//

import UIKit

final class MyPlaylistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        navigationController?.navigationBar.makeNavBarPurple()
        navigationItem.title = "My Playlist"
    }
}
