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
import PKHUD

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
      			 self.performSegue(withIdentifier: "authSuccess", sender: self)
      		}
    } else {
      print("Derrick Noting previous trace")
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
      consumerKey: Constants.GithubConfidentialInfo.GitHubClientID,
      consumerSecret: Constants.GithubConfidentialInfo.GitHubClientLicense,
      authorizeUrl: Constants.GithubOAuthInfo.OAuthBaseURL,
      accessTokenUrl: Constants.GithubOAuthInfo.OAuthTokenURL,
      responseType: Constants.ResponseType.CODE)
	
	  self.oauthswift = oauthSwift
	  oauthswift?.authorizeURLHandler = internalWebViewController
	  let state = generateState(withLength: 20)
	  let _ = oauthSwift.authorize(withCallbackURL: Constants.FIREBASEInfo.FIREBASE_CALLBACK_ADRESS
		, scope: Constants.GithubRequestValue.Default, state: state,
		  success: { credential, response, parameters in
			let accessToken = credential.oauthToken
			let credentialFir = FIRGitHubAuthProvider.credential(withToken: accessToken)
			self.authWithFirebase(credential: credentialFir)
			PKHUD.sharedHUD.contentView = PKHUDSuccessView()
			PKHUD.sharedHUD.show()
		},
		  failure:   { error in
			print(error.description)
		})
	
  }
 

	
	
	
}

extension LoginViewController {
	func authWithFirebase(credential: FIRAuthCredential) {
		
		FIRAuth.auth()?.signIn(with: credential) { (user, error) in
			PKHUD.sharedHUD.hide()
			self.performSegue(withIdentifier: "authSuccess", sender: self)
			if error != nil {
				return
			}
		}
	}
	
	
}
