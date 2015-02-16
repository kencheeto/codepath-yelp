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
    
    let yelpConsumerKey = "wKO9wEkDOvQFOHn59FYNfg"
    let yelpConsumerSecret = "0u5lkyQUzjxsbhOnl9-x6ldrb_o"
    let yelpToken = "pn4keIXccw6DjBquIf6Ko7vy4X3ezR8J"
    let yelpTokenSecret = "-fPvFaYpKmqcOCzHHc2Fau7-KCM"
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private var results = [:]
    private var client: YelpClient!

    override func viewDidLoad() {
        super.viewDidLoad()
        navTitle.titleView = UISearchBar()
        
        client = YelpClient(
            consumerKey: yelpConsumerKey,
            consumerSecret: yelpConsumerSecret,
            accessToken: yelpToken,
            accessSecret: yelpTokenSecret
        )
        
        client.searchWithTerm("Thai", success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            println(response)
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("ResultCell") as ResultCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
}

