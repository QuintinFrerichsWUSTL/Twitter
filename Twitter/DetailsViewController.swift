//
//  DetailsViewController.swift
//  Twitter
//
//  Created by Quintin Frerichs on 2/21/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
   var tweet: Tweet!
    @IBOutlet weak var replyButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var retweetsLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!


    
    @IBOutlet weak var twitterNameLabel: UILabel!
    var numberLikes: Int = 0
    var numberRetweets: Int = 0
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            numberLikes = tweet.numLikes!
            numberRetweets = tweet.numRetweets!
            let username = tweet.username
            nameLabel.text = username
            nameLabel.sizeToFit()
            let text = tweet.text
            textlabel.text = text
            textlabel.sizeToFit()
        if tweet.convertedDate != nil{
            let timeStamp = tweet.convertedDate
            timeLabel.text = timeStamp
        }
            if tweet.numLikes != nil{
                likesLabel.text = "\(numberLikes)"
                likesLabel.sizeToFit()
            }
            else{
                textlabel.text = ""
            }
            if tweet.numRetweets != nil{
                retweetsLabel.text = "\(numberRetweets)"
                retweetsLabel.sizeToFit()
            }
            else{
                retweetsLabel.text = ""
            }
            if tweet.user!.profileImageURL != nil{
                pictureView.setImageWithURL(tweet.user!.profileImageURL!)
            }
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onReply(sender: AnyObject) {
        replyButton.setImage(UIImage(named: "reply-action-pressed_0"), forState: UIControlState.Normal)
    }
    
    
    
    @IBAction func onRetweet(sender: AnyObject) {
        numberRetweets++
        retweetsLabel.textColor = UIColor(red: 0.6, green: 1.0, blue: 0.6, alpha: 1.0)
        retweetsLabel.text = "\(numberRetweets)"
       retweetButton.setImage(UIImage(named: "retweet-action-on-green"), forState: UIControlState.Normal)
        
        
    }
    
    
    @IBAction func onLike(sender: AnyObject) {
        numberLikes++
        likesLabel.textColor = UIColor(red: 0.86, green: 0.08, blue: 0.24, alpha: 1.0)
        likesLabel.text = "\(numberLikes)"
        likeButton.setImage(UIImage(named: "like-action-on-red"), forState: UIControlState.Normal)
    }
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
