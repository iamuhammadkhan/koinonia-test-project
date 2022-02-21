//
//  DownloadsTableViewCell.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/9/21.
//

import UIKit

final class DownloadsTableViewCell: UITableViewCell {

    @IBOutlet private weak var songTitleLabel: UILabel!
    @IBOutlet private weak var songDescriptionLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.layer.cornerRadius = 6
    }
    
    @IBAction private func moreTapped( _ sender: UIButton) {
        
    }
}
