//
//  DownloadsViewController.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/9/21.
//

import UIKit

final class DownloadsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: DownloadsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DownloadsTableViewCell.identifier)
        navigationController?.navigationBar.makeNavBarPurple()
        navigationItem.title = "Downloads"
    }
}

extension DownloadsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DownloadsTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        return cell
    }
}
