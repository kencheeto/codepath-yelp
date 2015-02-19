//
//  ToggleFilterCell.swift
//  codepath-yelp
//
//  Created by Kenshiro Nakagawa on 2/17/15.
//  Copyright (c) 2015 Kenshiro Nakagawa. All rights reserved.
//

import UIKit

final class ToggleFilterCell: UITableViewCell {

  @IBOutlet weak var toggleSwitch: UISwitch!
  @IBOutlet weak var toggleLabel: UILabel!
  
  var toggleType: String!
  weak var delegate: FilterCellDelegate?

  var toggle: String! {
    didSet {
      toggleLabel.text = toggle?.capitalizedString
      toggleSwitch.on = false
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
  
  @IBAction private func didToggle(sender: UISwitch) {
    if (sender.on) {
      delegate?.filterCell(self, didSetFilter: (toggleType, toggle))
    }
  }
}
