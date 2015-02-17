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
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var business: Business? {
        didSet {
            nameLabel.text = business?.name
            addressLabel.text = business?.address
            ratingView.setImageWithURL(business?.ratingUrl)
            photoView.layer.cornerRadius = 4.0
            photoView.layer.borderColor = UIColor.whiteColor().CGColor
            photoView.layer.masksToBounds = true
            photoView.setImageWithURL(business?.photoUrl)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        separatorInset = UIEdgeInsetsZero
        preservesSuperviewLayoutMargins = false
        layoutMargins = UIEdgeInsetsZero
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
