//
//  BusinessCell.swift
//  codepath-yelp
//
//  Created by Kenshiro Nakagawa on 2/14/15.
//  Copyright (c) 2015 Kenshiro Nakagawa. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    var business: Business? {
        didSet {
            nameLabel.text = business?.name
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
