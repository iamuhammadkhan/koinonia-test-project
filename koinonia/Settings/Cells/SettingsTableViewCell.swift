//
//  SettingsTableViewCell.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/9/21.
//

import UIKit

final class SettingsTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var notificationSwitch: UISwitch!
    @IBOutlet private weak var borderLineView: UIView!
    
    func configure(with model: SettingsData, shouldHideBorder: Bool) {
        titleLabel.text = model.title
        if let subTitle = model.subTitle {
            subTitleLabel.text = subTitle
        } else {
            subTitleLabel.isHidden = true
        }
        if model.hasImage, let image = model.image {
            iconImageView.image = image
        } else {
            iconImageView.isHidden = true
        }
        notificationSwitch.isHidden = !model.hasSwitch
        borderLineView.isHidden = shouldHideBorder
    }
    
    @IBAction func switchTapped( _ sender: UISwitch) {
        if sender.isOn {
            print("It is On")
        }
        print("Switch is On:-", sender.isOn)
    }
}
