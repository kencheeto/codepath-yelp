//
//  CategoryFilterCell.swift
//  codepath-yelp
//
//  Created by Kenshiro Nakagawa on 2/17/15.
//  Copyright (c) 2015 Kenshiro Nakagawa. All rights reserved.
//

import UIKit

final class CategoryFilterCell: UITableViewCell {
  
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet private weak var categorySwitch: UISwitch!
  
  weak var delegate: FilterCellDelegate?

  var category: String! {
    didSet {
      categoryLabel.text = category?.capitalizedString
      categorySwitch.on = false
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  @IBAction private func categoryToggled(sender: UISwitch) {
    if (sender.on) {
      delegate?.filterCell(self, didSetFilter: ("category", category))
    }
  }
}
