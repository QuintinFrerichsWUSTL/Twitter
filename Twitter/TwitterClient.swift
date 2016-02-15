//
//  TwitterClient.swift
//  Twitter
//
//  Created by Quintin Frerichs on 2/14/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//

import BDBOAuth1Manager
import UIKit
let twitterConsumerKey = "uhMsNkikco7EERX3i9gQTZoaH"
let twitterConsumerSecret = "KneJ9dzYVYVSVoL8mFMuoUCkYGNmLkwlDtjW5ze9eYP11uBu9Y"
let twitterBaseURL = NSURL(string:"https://api.twitter.com")

class TwitterClient: BDBOAuth1SessionManager {
    
    class var sharedInstance: TwitterClient{
        struct Static{
            static let instance = TwitterClient(baseURL:twitterBaseURL, consumerKey:twitterConsumerKey,consumerSecret:twitterConsumerSecret)
        }
        return Static.instance
    }

}
