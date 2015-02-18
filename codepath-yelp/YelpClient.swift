//
//  YelpClient.swift
//  codepath-yelp
//
//  Created by Kenshiro Nakagawa on 2/15/15.
//  Copyright (c) 2015 Kenshiro Nakagawa. All rights reserved.
//

import UIKit

final class YelpClient: BDBOAuth1RequestOperationManager {
  private let consumerKey = "wKO9wEkDOvQFOHn59FYNfg"
  private let consumerSecret = "0u5lkyQUzjxsbhOnl9-x6ldrb_o"
  private let accessToken = "pn4keIXccw6DjBquIf6Ko7vy4X3ezR8J"
  private let accessSecret = "-fPvFaYpKmqcOCzHHc2Fau7-KCM"
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  init() {
    super.init(
      baseURL: NSURL(string: "http://api.yelp.com/v2/"),
      consumerKey: consumerKey,
      consumerSecret: consumerSecret
    );
    
    var token = BDBOAuth1Credential(token: accessToken, secret: accessSecret, expiration: nil)
    self.requestSerializer.saveAccessToken(token)
  }
  
  func searchWithTerm(
    term: String,
    success: (AFHTTPRequestOperation!, AnyObject!) -> Void,
    failure: (AFHTTPRequestOperation!, NSError!) -> Void
    ) -> AFHTTPRequestOperation! {
      // For additional parameters, see http://www.yelp.com/developers/documentation/v2/search_api
      var parameters = [
        "term": term,
        "ll": "37.782193,-122.410254"
      ]
      return self.GET(
        "search",
        parameters: parameters,
        success: success,
        failure: failure
      )
  }
  
}