//
//  AppDelegate.swift
//  CommitPic
//
//  Created by derrick on 2017. 3. 16..
//  Copyright © 2017년 Superbderrick. All rights reserved.
//

import UIKit
import Firebase
import OAuthSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		FIRApp.configure()
		return true
	}
	func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
		applicationHandle(url: url as URL)
		return true
	}
	

}
extension AppDelegate {
	
	func applicationHandle(url: URL) {
			OAuthSwift.handle(url: url)
	}
}
