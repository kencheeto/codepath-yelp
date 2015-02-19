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
  
  @IBOutlet weak var searchButton: UIBarButtonItem!
  @IBOutlet weak var cancelButton: UIBarButtonItem!
  @IBOutlet private weak var tableView: UITableView!

  weak var delegate: FiltersViewControllerDelegate?
  
  private var filters: [String:String] = [:]
//  private let categories = ["ramen", "sushi", "indian", "yakitori"]
//  private let sections = ["categories", "sort", "radius", "deals"]
  let sections = [
    (type: "categories", options: ["ramen", "sushi", "indian", "yakitori"]),
    (type: "sort", options: ["best match", "distance", "highest rated"]),
    (type: "radius", options: ["within 1km"]),
    (type: "deals", options: ["with deals"])
  ]
//  private let sortOptions = ["best match", "distance", "highest rated"]
  @IBAction func onCancelButton(sender: UIBarButtonItem) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func onApplyButton(sender: UIBarButtonItem) {
    delegate?.filtersViewController(self, didApplyFilters: filters)
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
  }
  
  internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section < 0 || section > 3 { 0 }
    return sections[section].options.count
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
    case 0, 1:
      var toggleCell = tableView.dequeueReusableCellWithIdentifier("ToggleFilterCell") as ToggleFilterCell
      toggleCell.toggleType = sections[indexPath.section].type
      toggleCell.toggle = sections[indexPath.section].options[indexPath.row]
      toggleCell.delegate = self
      return toggleCell
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