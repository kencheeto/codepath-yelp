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

final class FiltersViewController: UIViewController, UITableViewDataSource {
  
  @IBOutlet private weak var tableView: UITableView!

  weak var delegate: FiltersViewControllerDelegate?
  
  private var filters: [String:String] = [:]
  private let categories = ["ramen", "sushi", "yakitori"]
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
    return categories.count
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
    var cell = tableView.dequeueReusableCellWithIdentifier("CategoryFilterCell") as CategoryFilterCell
    cell.categoryLabel.text = categories[indexPath.row]
    cell.delegate = self
    return cell
  }
}