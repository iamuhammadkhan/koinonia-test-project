//
//  HomeBannerFSPagerViewCell.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/10/21.
//

import UIKit
import FSPagerView

final class HomeBannerFSPagerViewCell: FSPagerViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var bannerImageView: UIImageView!
    @IBOutlet private weak var mainTitleLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageCountLabel: UILabel!
    @IBOutlet private weak var seperatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        containerView.layer.cornerRadius = 6
//        seperatorView.layer.cornerRadius = 1
    }

}
