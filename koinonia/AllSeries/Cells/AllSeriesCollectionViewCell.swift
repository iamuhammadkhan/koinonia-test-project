//
//  AllSeriesCollectionViewCell.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/9/21.
//

import UIKit

final class AllSeriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var shadowView: UIView!
    @IBOutlet private weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.applyShadow()
        containerView.layer.cornerRadius = 6
    }

}
