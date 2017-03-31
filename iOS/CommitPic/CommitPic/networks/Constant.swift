//
//  GithubConstant.swift
//  CommitPic
//
//  Created by Kang Jinyeoung on 2017. 3. 19..
//  Copyright © 2017년 Superbderrick. All rights reserved.
//

import UIKit

struct Constants {
  struct GitHub {
	static let BASE_API_URL = "https://api.github.com/"
  }
	
  struct GithubOAuthInfo {
    static let OAuthBaseURL  =  "https://github.com/login/oauth/authorize"
    static let OAuthTokenURL =  "https://github.com/login/oauth/access_token"
  }
	
  struct GithubConfidentialInfo {
	static let GitHubClientID = "27d55a14358fac7ff91e"
	static let GitHubClientLicense = "fcabd415740afe91ef9ec8521fcdeeff3debe8ec"
  }
	
  struct GithubResponseStatus {
	static let OKStatus = 200
	static let ErrorStatus = 299
  }
	
  struct GithubRequestValue {
	static let Default = "events"
	static let TEST = "users/superbderrick/events"
  }
	
	
  struct ResponseType {
	static let CODE = "code"
  }
	
  struct FIREBASEInfo {
	static let FIREBASE_CALLBACK_ADRESS = "https://commitpic.firebaseapp.com/__/auth/handler"
  }
	
  struct EventType {
	static let PushEvent = "PushEvent"
	static let Language = "language"
  }
	
}
