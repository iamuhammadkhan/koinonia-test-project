//
//  SideMenuTableViewCell.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/7/21.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet private weak var sectionTitleLabel: UILabel!
    @IBOutlet private weak var sectionIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            contentView.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
            sectionIconImageView.tintColor = #colorLiteral(red: 0.2823529412, green: 0.1725490196, blue: 0.462745098, alpha: 1)
            sectionTitleLabel.textColor = #colorLiteral(red: 0.2823529412, green: 0.1725490196, blue: 0.462745098, alpha: 1)
        } else {
            contentView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
            sectionIconImageView.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            sectionTitleLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
    }
    
    func configure(with model: SideMenuData) {
        sectionIconImageView.image = model.icon
        sectionTitleLabel.text = model.title
    }
}
