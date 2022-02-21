//
//  AllMessagesTableViewCell.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/9/21.
//

import UIKit
import Cosmos

final class AllMessagesTableViewCell: UITableViewCell {

    @IBOutlet private weak var songTitleLabel: UILabel!
    @IBOutlet private weak var songDescriptionLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var viewsImageView: UIImageView!
    @IBOutlet private weak var viewsLabel: UILabel!
    @IBOutlet private weak var downloadsImageView: UIImageView!
    @IBOutlet private weak var downloadsLabel: UILabel!
    @IBOutlet private weak var counterView: UIView!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var ratingView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.layer.cornerRadius = 6
        counterView.layer.cornerRadius = 3
    }
    
    @IBAction private func moreTapped( _ sender: UIButton) {
        
    }
}
