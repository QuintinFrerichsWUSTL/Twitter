//
//  ViewController.swift
//  Twitter
//
//  Created by Quintin Frerichs on 2/14/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//


import BDBOAuth1Manager
import UIKit
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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