//
//  FiltersViewController.swift
//  codepath-yelp
//
//  Created by Kenshiro Nakagawa on 2/17/15.
//  Copyright (c) 2015 Kenshiro Nakagawa. All rights reserved.
//

import UIKit

protocol FilterCellDelegate : class {
  func filterCell(cell: UITableViewCell, didSetFilter filter: (String,String))
}

protocol FiltersViewControllerDelegate : class {
  func filtersViewController(viewController: UIViewController, didApplyFilters filters: [String:String])
}

final class FiltersViewController: UIViewController {
  
  @IBOutlet private weak var tableView: UITableView!

  weak var delegate: FiltersViewControllerDelegate?
  
  private var filters: [String:String] = [:]
  private let categories = ["ramen", "sushi", "indian", "yakitori"]
  private let sections = ["categories", "sort", "radius", "deals"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "onCancelButton")
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Apply", style: UIBarButtonItemStyle.Plain, target: self, action: "onApplyButton")
  }
  
  func onCancelButton() {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func onApplyButton() {
    delegate?.filtersViewController(self, didApplyFilters: filters)
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let rowsPerSection = [
      0: 4, // categories
      1: 3, // ways to sort
      2: 1, // radius to filter by
      3: 1  // option to toggle deals
    ]
    if rowsPerSection[section] != nil {
      return rowsPerSection[section]!
    } else {
      return 0
    }
  }
}

// MARK: - FilterCellDelegate
extension FiltersViewController: FilterCellDelegate {
  internal func filterCell(cell: UITableViewCell, didSetFilter filter: (String,String)) {
    let (type, value) = filter
    filters[type] = value
  }
}

// MARK: - UITableViewDataSource
extension FiltersViewController: UITableViewDataSource {
  internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      var categoryCell = tableView.dequeueReusableCellWithIdentifier("CategoryFilterCell") as CategoryFilterCell
      categoryCell.category = categories[indexPath.row]
      categoryCell.delegate = self
      return categoryCell
//    case 1:
//      var sortCell = tableView.dequeueReusableCellWithIdentifier("SortFilterCell") as
//    case 2:
//    case 3:
    default:
      return UITableViewCell()
    }
  }
  
  internal func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 4 // categories, sort, radius, deals
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return [
      0: "Categories",
      1: "Sort by",
      2: "Within",
      3: "Deals on/off"
    ][section]
  }
}