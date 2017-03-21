//
//  LoginViewController.swift
//  CommitPic
//
//  Created by Kang Jinyeoung on 2017. 3. 19..
//  Copyright © 2017년 Superbderrick. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import OAuthSwift

class LoginViewController: OAuthViewController {
  @IBOutlet weak var loginButton: UIButton!
  var oauthswift: OAuthSwift?
  
  lazy var internalWebViewController: WebViewController = {
    let controller = WebViewController()
    controller.view = UIView(frame: UIScreen.main.bounds)
    controller.viewDidLoad()
    return controller
  }()
	
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if FIRAuth.auth()?.currentUser != nil {
      		performUIUpdatesOnMain {
      			 print((FIRAuth.auth()?.currentUser?.displayName)! as String)
      		}
    } else {
      print("Noting previous trace")
    }
  }
	
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated);
  }
 
  @IBAction func loginPressed(_ sender: Any) {
		doOAuthGithub();
  }
  
  func doOAuthGithub() {
    let oauthSwift = OAuth2Swift(
      consumerKey: Constants.ConfidentialInfo.GitHubClientID,
      consumerSecret: Constants.ConfidentialInfo.GitHubClientLicense,
      authorizeUrl: Constants.GitHUBOAuthInfo.OAuthBaseURL,
      accessTokenUrl: Constants.GitHUBOAuthInfo.OAuthTokenURL,
      responseType: Constants.ResponseType.CODE)
    
    self.oauthswift = oauthSwift
    oauthswift?.authorizeURLHandler = internalWebViewController
  }


  
  
}

extension LoginViewController {
	
	
}
