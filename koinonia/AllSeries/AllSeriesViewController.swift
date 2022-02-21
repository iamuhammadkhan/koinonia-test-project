//
//  AllSeriesViewController.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/9/21.
//

import UIKit

final class AllSeriesViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: AllSeriesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: AllSeriesCollectionViewCell.identifier)
        navigationController?.navigationBar.makeNavBarPurple()
        navigationItem.title = "All Series"
    }
}

extension AllSeriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AllSeriesCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height / 3.3)
    }
}
