//
//  TwitterTableViewCell.swift
//  Twitter
//
//  Created by Quintin Frerichs on 2/16/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//

import UIKit

class TwitterTableViewCell: UITableViewCell {

    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    var tweet: Tweet!{
        didSet{
            if tweet.createdAtString != nil{
            timeLabel.text = tweet.createdAtString
            }
            else{
                timeLabel.text = nil
            }
            if tweet.profilepictureURl != nil{
             profileImageView.setImageWithURL(tweet.profilepictureURl!)
            }
           
            if tweet.username != nil{
            usernameLabel.text = tweet.username
            }
            else{
                usernameLabel.text = nil
            }
            if tweet.text != nil{
            tweetLabel.text = tweet.text
            }
            else{
                tweetLabel.text = nil
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
