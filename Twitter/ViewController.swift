//
//  ViewController.swift
//  Twitter
//
//  Created by Quintin Frerichs on 2/14/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//


import BDBOAuth1Manager
import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tweets: [Tweet]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 30
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("TwitterTableViewCell", forIndexPath: indexPath) as! TwitterTableViewCell
        cell.tweet = tweets[indexPath.row]
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogin(sender: AnyObject) {
        TwitterClient.sharedInstance.loginWithCompletion(){
            (user:User?, error: NSError?) in
            if user != nil {
               self.performSegueWithIdentifier("loginSegue", sender: self)
            }
            else{
                //handle login error 
            }
        }
       
        
    }
    
}