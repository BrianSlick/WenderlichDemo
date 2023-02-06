//
//  FeedTableViewCell.swift
//  Wenderlich
//
//  Created by Brian Slick on 2/4/23.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var contentTypeLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        descriptionLabel.text = nil
        thumbnailImageView.image = nil
        contentTypeLabel.text = nil
        dateLabel.text = nil
    }
}
