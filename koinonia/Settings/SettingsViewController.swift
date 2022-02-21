//
//  SettingsViewController.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/9/21.
//

import UIKit

final class SettingsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: SettingsTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: SettingsTableViewCell.identifier)
        navigationController?.navigationBar.makeNavBarPurple()
        navigationItem.title = "Settings"
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsDataProvider().generateData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SettingsTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let data = SettingsDataProvider().generateData()
        let row = indexPath.row
        cell.configure(with: data[row], shouldHideBorder: data.count == (row + 1))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}
