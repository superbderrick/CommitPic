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

class DailyCommitViewController: UIViewController {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
