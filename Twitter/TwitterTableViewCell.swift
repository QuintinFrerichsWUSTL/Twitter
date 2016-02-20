//
//  TwitterTableViewCell.swift
//  Twitter
//
//  Created by Quintin Frerichs on 2/16/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//

import UIKit

class TwitterTableViewCell: UITableViewCell {

    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favsButton: UIButton!
    
    @IBOutlet weak var retweetsLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    var favoriteCount: Int = 0
    var retweetedCount: Int = 0
    var tweet: Tweet!{
        didSet{
             if(favoriteCount>=1){
            favoritesLabel.text = "\(favoriteCount)"
            }
             else{
                favoritesLabel.text = ""
            }
            if(retweetedCount >= 1)
            {
            retweetsLabel.text = "\(retweetedCount)"
            }
            else{
                retweetsLabel.text = ""
            }
            if tweet.createdAtString != nil{
            timeLabel.text = tweet.convertedDate
            }
            else{
                timeLabel.text = nil
            }
            if tweet.user!.profileImageURL != nil{
             profileImageView.setImageWithURL(tweet.user!.profileImageURL!)
            }
           
            if tweet.username != nil{
            usernameLabel.text = tweet.username
            }
            else{
                usernameLabel.text = nil
            }
            if tweet.text != nil{
            tweetLabel.text = tweet.text
            tweetLabel.sizeToFit()
            }
            else{
                tweetLabel.text = nil
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 3
        profileImageView.clipsToBounds = true
        usernameLabel.preferredMaxLayoutWidth = usernameLabel.frame.size.width
        
        // Initialization code
    }

    @IBAction func onFavorite(sender: AnyObject) {
        favoriteCount++
       
        favoritesLabel.text = "\(favoriteCount)"
        favsButton.setImage(UIImage(named: "like-action-on-red"), forState: UIControlState.Normal)
    }
    
    
    @IBAction func onRetweet(sender: AnyObject) {
        retweetedCount++
            retweetsLabel.text = "\(retweetedCount)"
        retweetButton.setImage(UIImage(named:"retweet-action-on-green"), forState: UIControlState.Normal)
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
