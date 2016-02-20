//
//  Tweet.swift
//  Twitter
//
//  Created by Quintin Frerichs on 2/16/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    var username: String?
    var convertedDate: String?
    var profilepictureURl: NSURL?
    init(dictionary: NSDictionary){
        let calendar = NSCalendar.currentCalendar()
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        username = user?.name
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        
//        var formatter = NSDateFormatter()
//        createdAt = formatter.dateFromString(createdAtString!)
//        
//        if let timeCreation = createdAt{
//        let dateComponent = NSDateComponents()
//        dateComponent.hour = calendar.component(NSCalendarUnit.Hour, fromDate:createdAt!)
//        dateComponent.minute = calendar.component(NSCalendarUnit.Minute, fromDate:createdAt!)
//        let newDate = calendar.dateFromComponents(dateComponent)
//        formatter.dateFormat = "HH:mm"
//            convertedDate = formatter.stringFromDate(newDate!)
//        }
        var formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        convertedDate = formatter.stringFromDate(createdAt!)
        
        
    }
    class func tweetsWithArray(array: [NSDictionary])-> [Tweet]{
        var tweets = [Tweet]()
        for dictionary in array{
            tweets.append(Tweet(dictionary: dictionary))
        }
        return tweets
    }
    
}
