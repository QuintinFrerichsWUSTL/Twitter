//
//  AppDelegate.swift
//  Twitter
//
//  Created by Quintin Frerichs on 2/14/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//
import BDBOAuth1Manager
import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var storyboard = UIStoryboard(name: "Main", bundle: nil)

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
//        window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        let storyboard = UIStoryboard(name: "Main", bundle:nil)
//        let vc1 = storyboard.instantiateViewControllerWithIdentifier("ViewController")
//            as! UINavigationController
//        window?.rootViewController = vc1
//        let tweetsNavigationController = storyboard.instantiateViewControllerWithIdentifier("LoginNavigationController") as! UINavigationController
//        let tweetsViewController = tweetsNavigationController.topViewController as! TweetsViewController
//        tweetsNavigationController.tabBarItem.title = "Timelines"
//        tweetsNavigationController.tabBarItem.image = UIImage(named: "noun_17354")
//        let profileNavigationController = storyboard.instantiateViewControllerWithIdentifier("LoginNavigationCongroller") as! UINavigationController
//        let profileViewController = profileNavigationController.topViewController as! TweetsViewController
//        profileNavigationController.tabBarItem.title = "Me"
//        profileNavigationController.tabBarItem.image = UIImage(named: "noun_16571")
//        let tabBarController = UITabBarController()
//        UITabBar.appearance().tintColor = UIColor(red:1.0, green: 0.1, blue: 0.1, alpha: 0.9)
//        tabBarController.viewControllers = [tweetsNavigationController, profileNavigationController]
//        window?.rootViewController = tabBarController
//        window?.makeKeyAndVisible()

        

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "userDidLogout", name: userDidLogoutNotification, object: nil)
        if User.currentUser != nil{
            print("Current user detected: \(User.currentUser?.name)")
            let vc = storyboard.instantiateViewControllerWithIdentifier("TweetsViewController") as UIViewController
            window?.rootViewController = vc 
        }
        return true
        
    }
    func userDidLogout(){
        var vc = storyboard.instantiateInitialViewController()! as UIViewController
        window?.rootViewController = vc
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        TwitterClient.sharedInstance.openURL(url)
                return true
    }


}

