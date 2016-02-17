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
    var loginCompletion:((user: User?, error: NSError?)->())?
    class var sharedInstance: TwitterClient{
        struct Static{
            static let instance = TwitterClient(baseURL:twitterBaseURL, consumerKey:twitterConsumerKey,consumerSecret:twitterConsumerSecret)
        }
        return Static.instance
    }
    func loginWithCompletion(completion: (user: User?, error: NSError?)->()){
        loginCompletion = completion
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string:"cptwitterQuintin://oauth"), scope: nil, success: { (requestToken:BDBOAuth1Credential!) -> Void in
            print("Successfully got Token.")
            var authURL = NSURL(string:"https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            UIApplication.sharedApplication().openURL(authURL!)
            }) { (error: NSError!) -> Void in
                print("Failure. Complete failure")
                self.loginCompletion?(user: nil, error: error)
        }
    }
    func homeTimeLineWithParams(params: NSDictionary?, completion_: (tweets: [Tweet]?, error: NSError?)->()){
        GET("1.1/statuses/home_timeline.json", parameters: params, success: { (operation: NSURLSessionDataTask!, response:  AnyObject?) -> Void in
            //print("status: \(response)")
            var tweets = Tweet.tweetsWithArray(response as! [NSDictionary])
            completion_(tweets: tweets, error: nil)
            }, failure: { (operation: NSURLSessionDataTask?, error:NSError) -> Void in
                print("Failure to get twitter feed")
                completion_(tweets: nil, error: error)
        })

    }
    func openURL(url: NSURL){
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: BDBOAuth1Credential (queryString:url.query), success: { (accessToken: BDBOAuth1Credential!) -> Void in
            print("Got access token")
            TwitterClient.sharedInstance.requestSerializer.saveAccessToken(accessToken)
            TwitterClient.sharedInstance.GET("1.1/account/verify_credentials.json", parameters: nil, success: { (operation: NSURLSessionDataTask!, response: AnyObject?) -> Void in
                
                //print("user: \(response)")
                var user = User(dictionary: response as! NSDictionary)
                User.currentUser = user 
                print("user: \(user.name)")
                self.loginCompletion?(user: user, error: nil)
                }, failure: { (operation: NSURLSessionDataTask?, error:NSError) -> Void in
                    print("Error getting the current user")
                    self.loginCompletion?(user: nil, error: error)
            })
            
            
            }) { (error: NSError!) -> Void in
                print("Failed to get access token")
                self.loginCompletion?(user: nil, error: error)
        }

    }

}
