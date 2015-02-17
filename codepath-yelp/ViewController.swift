//
//  ViewController.swift
//  codepath-yelp
//
//  Created by Kenshiro Nakagawa on 2/13/15.
//  Copyright (c) 2015 Kenshiro Nakagawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var navTitle: UINavigationItem!
    
    private var businesses: [Business] = []
    private let client = YelpClient()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navTitle.titleView = UISearchBar()
        tableView.dataSource = self
        tableView.delegate = self
        
        client.searchWithTerm("ramen",
            success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                let json = response as [String:AnyObject]
                if let jsonBusinesses = json["businesses"] as? [[String:AnyObject]] {
                    for jsonBusiness in jsonBusinesses {
                        var business = Business(json: jsonBusiness)
                        self.businesses.append(business)
                    }
                    self.tableView.reloadData()
                }
            }
        ) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell") as BusinessCell
        cell.business = businesses[indexPath.row] as Business
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
}

