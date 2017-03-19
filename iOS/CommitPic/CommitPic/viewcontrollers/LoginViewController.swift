//
//  LoginViewController.swift
//  CommitPic
//
//  Created by Kang Jinyeoung on 2017. 3. 19..
//  Copyright © 2017년 Superbderrick. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  @IBOutlet weak var loginButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated);
  }
 
  @IBAction func loginPressed(_ sender: Any) {
    GitHubOAuth.shared.requestAuthenticationWith(parameters: ["scope" : "email,user,repo"])
//    let controller = self.storyboard!.instantiateViewController(withIdentifier: "myTabBarController") as! UITabBarController
//    self.present(controller, animated: true, completion: nil)
//GitHubOAuth.shared.oAuthRequestWith(["scope" : "email,user,repo"])
  }

  
  
}
