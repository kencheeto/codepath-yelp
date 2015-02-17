//
//  Business.swift
//  codepath-yelp
//
//  Created by Kenshiro Nakagawa on 2/16/15.
//  Copyright (c) 2015 Kenshiro Nakagawa. All rights reserved.
//

class Business {
    let data: [String:AnyObject]!

    init(json: [String:AnyObject]) {
        self.data = json
    }
    
    var name: String? {
        return data["name"] as? String
    }
    
    var photoUrl: NSURL? {
        return NSURL(string: data["image_url"] as String!)
    }

    var ratingUrl: NSURL? {
        return NSURL(string: data["rating_img_url_small"] as String!)
    }

}