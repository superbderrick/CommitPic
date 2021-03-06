//
//  DailyCommitViewController.swift
//  CommitPic
//
//  Created by derrick on 2017. 3. 22..
//  Copyright © 2017년 Superbderrick. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ProfilController: UIViewController {
  @IBOutlet weak var logoutButton: UIButton!
	@IBOutlet weak var currentStatusButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		var statusTitle:String
		if FIRAuth.auth()?.currentUser != nil {
			statusTitle = "signed"
		} else {
			statusTitle = "WeirdStatus"
		}
		
		
		currentStatusButton.setTitle(statusTitle, for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
  @IBAction func doLogout(_ sender: Any) {
    let firebaseAuth = FIRAuth.auth()
    do {
      try firebaseAuth?.signOut()
      self.performSegue(withIdentifier: "returnLogin", sender: self)
       //self.tabBarController?.tabBar.isHidden = true
      self.tabBarController?.tabBar.isHidden = true
      print("logged out")
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
