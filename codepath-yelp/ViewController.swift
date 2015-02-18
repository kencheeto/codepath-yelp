//
//  ViewController.swift
//  codepath-yelp
//
//  Created by Kenshiro Nakagawa on 2/13/15.
//  Copyright (c) 2015 Kenshiro Nakagawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FiltersViewControllerDelegate {

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private weak var filterButton: UIBarButtonItem!
    
    private var businesses: [Business] = []
    private let client = YelpClient()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = UISearchBar()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        
        search("ramen")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func search(term: String) {
        println("searching for ")
        println(term)
        self.businesses = []
        client.searchWithTerm(term,
            success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                let json = response as [String:AnyObject]
                if let jsonBusinesses = json["businesses"] as? [[String:AnyObject]] {
                    for jsonBusiness in jsonBusinesses {
                        self.businesses.append(Business(json: jsonBusiness))
                    }
                    self.tableView.reloadData()
                }
            }
            ) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell") as BusinessCell
        cell.business = businesses[indexPath.row] as Business
        return cell
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    internal func filtersViewController(viewController: UIViewController, didApplyFilters filters: [String:String]) {
        println("filters are: ")
        println(filters)
        if let term = filters["category"] {
            search(filters["category"]!)
        } else {
            search("ramen")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let filtersViewController = (segue.destinationViewController as UINavigationController).topViewController as FiltersViewController
        filtersViewController.delegate = self
    }
}

