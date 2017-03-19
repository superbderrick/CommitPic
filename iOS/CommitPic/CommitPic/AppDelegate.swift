//
//  AppDelegate.swift
//  CommitPic
//
//  Created by derrick on 2017. 3. 16..
//  Copyright © 2017년 Superbderrick. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		return true
	}
  
  func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
    print("AppDelegate - OpernURL func URL:\(url)")
    
//    GitHubOAuth.shared.tokenRequestWithCallback(url, options: SaveOptions.userDefaults) { (sucess) in
//      if sucess{
//        print("We have a token!!")
//      }
//    }
    return true
  }

	

}

