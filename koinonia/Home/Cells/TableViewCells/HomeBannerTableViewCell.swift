//
//  HomeBannerTableViewCell.swift
//  koinonia
//
//  Created by Muhammad Khan on 7/10/21.
//

import UIKit
import FSPagerView

final class HomeBannerTableViewCell: UITableViewCell {

    @IBOutlet private weak var pagerView: FSPagerView! {
        didSet {
            pagerView.register(HomeBannerFSPagerViewCell.self, forCellWithReuseIdentifier: HomeBannerFSPagerViewCell.identifier)
            pagerView.itemSize = FSPagerView.automaticSize
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.automaticSlidingInterval = 4
        pagerView.itemSize = CGSize(width: pagerView.frame.width - 40, height: pagerView.frame.height - 8)
        pagerView.transformer = FSPagerViewTransformer(type: .linear)
//        pagerView.interitemSpacing = 0
        pagerView.isInfinite = true
    }
}

extension HomeBannerTableViewCell: FSPagerViewDataSource, FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 5
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        guard let cell = pagerView.dequeueReusableCell(withReuseIdentifier: HomeBannerFSPagerViewCell.identifier, at: index) as? HomeBannerFSPagerViewCell else { return FSPagerViewCell() }
        cell.imageView?.image = #imageLiteral(resourceName: "bg")
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        cell.imageView?.layer.cornerRadius = 6
        if let label = cell.viewWithTag(23) as? UILabel {
            label.removeFromSuperview()
        }
            let label = UILabel(frame: CGRect(x: 8, y: 120, width: cell.frame.width - 16, height: 30))
            label.font = .boldSystemFont(ofSize: 24)
            label.textAlignment = .left
            label.numberOfLines = 0
            label.textColor = .white
            label.text = "\(index): Hey, Its just for testing purpose only"
            cell.addSubview(label)
            label.tag = 23
//        }
        
//        cell.textLabel?.text = "\(index): Its just for testing purpose"
        return cell
    }
}
