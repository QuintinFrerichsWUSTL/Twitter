//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Quintin Frerichs on 2/16/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var tweeters: [Tweet]?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refreshControlAction:", forControlEvents:UIControlEvents.ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
            
    TwitterClient.sharedInstance.homeTimeLineWithParams(nil, completion_:{(tweets,error)->() in
            self.tweeters = tweets
            self.tableView.reloadData()
        })
        // Do any additional setup after loading the view.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if tweeters != nil{
            return tweeters!.count
        }
        else{
            return 0
        }
    }
    func refreshControlAction(refreshControl: UIRefreshControl){
        
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("TwitterTableViewCell", forIndexPath: indexPath) as! TwitterTableViewCell
        cell.tweet = tweeters![indexPath.row]
        cell.favsButton.setImage(UIImage(named: "like-action-on-pressed-red"), forState: UIControlState.Normal)
        cell.retweetButton.setImage(UIImage(named:"retweet-action-on-pressed_green"), forState: UIControlState.Normal)
        
       
        return cell
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
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
