//
//  BusinessCell.swift
//  codepath-yelp
//
//  Created by Kenshiro Nakagawa on 2/14/15.
//  Copyright (c) 2015 Kenshiro Nakagawa. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var ratingView: UIImageView!
    
    var business: Business? {
        didSet {
            nameLabel.text = business?.name
            ratingView.setImageWithURL(business?.ratingUrl)
            photoView.setImageWithURL(business?.photoUrl)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
