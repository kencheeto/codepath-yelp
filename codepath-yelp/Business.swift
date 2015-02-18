//
//  Business.swift
//  codepath-yelp
//
//  Created by Kenshiro Nakagawa on 2/16/15.
//  Copyright (c) 2015 Kenshiro Nakagawa. All rights reserved.
//

final class Business {
  let data: [String:AnyObject]!
  
  init(json: [String:AnyObject]) {
    self.data = json
  }
  
  var name: String? {
    return data["name"] as? String
  }
  
  var snippet: String? {
    return data["snippet_text"] as? String
  }
  
  var address: String? {
    if let location = data["location"] as? [String:AnyObject] {
      return (location["address"] as [String]).first
    }
    return nil
  }
  
  var distance: String? {
    return "0.5 miles"
  }
  
  var photoUrl: NSURL? {
    if let url = data["image_url"] as? String {
      return NSURL(string: url)
    }
    return nil
  }
  
  var ratingUrl: NSURL? {
    if let url = data["rating_img_url"] as? String {
      return NSURL(string: url)
    }
    return nil
  }
  
}