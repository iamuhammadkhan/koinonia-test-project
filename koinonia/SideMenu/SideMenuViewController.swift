//
//  SideMenuViewController.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/7/21.
//

import UIKit

protocol SideMenuDelegate: NSObject {
    func subMenuTapped(_ data: SideMenuData)
}

final class SideMenuViewController: UIViewController {

    @IBOutlet private weak var appNameLabel: UILabel!
    @IBOutlet private weak var appSloganLabel: UILabel!
    @IBOutlet private weak var appIconImageView: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    
    private lazy var canPerformTransition = true
    weak var delegate: SideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        canPerformTransition = true
    }
    
    private func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: SideMenuTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: SideMenuTableViewCell.identifier)
        navigationController?.navigationBar.makeTransparent()
    }
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SideMenuDataProvider().generateData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SideMenuTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let data = SideMenuDataProvider().generateData()
        cell.configure(with: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = SideMenuDataProvider().generateData()
        if canPerformTransition {
            canPerformTransition = false
            dismiss(animated: true)
            delegate?.subMenuTapped(data[indexPath.row])
        }
    }
}
