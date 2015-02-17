//
//  Business.swift
//  codepath-yelp
//
//  Created by Kenshiro Nakagawa on 2/16/15.
//  Copyright (c) 2015 Kenshiro Nakagawa. All rights reserved.
//

class Business {
    let name: String!
    
    init(json: [String:AnyObject]) {
        self.name = json["name"] as? String
    }
}