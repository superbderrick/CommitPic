//
//  GithubConstant.swift
//  CommitPic
//
//  Created by Kang Jinyeoung on 2017. 3. 19..
//  Copyright © 2017년 Superbderrick. All rights reserved.
//

import UIKit

struct Constants {
  
  struct GitHUBOAuthInfo {
    static let TokenKey                = "kAccessTokenKey"
    static let OAuthBaseURL            = "https://github.com/login/oauth/authorize"
	static let OAuthTokenURL            = "https://github.com/login/oauth/access_token"
	static let AccessTokenRegexPattern = "access_token=([^&]+)"
  }
	
	struct ResponseType {
		static let CODE = "code"
	}
	
  struct ConfidentialInfo {
    static let GitHubClientID = "27d55a14358fac7ff91e"
    static let GitHubClientLicense = "fcabd415740afe91ef9ec8521fcdeeff3debe8ec"
  }
  
  struct GitHUB {
    static let APIBaseURL = "https://GitHUB/services/rest/"
  }
  
  // MARK: GitHUB Parameter Keys
  struct GitHUBParameterKeys {
    static let ClientID = "authorize?client_id"
  }
  
  struct GitHUBResponseKeys {
    static let Status = "stat"
    static let Photos = "photos"
    static let Photo = "photo"
    static let Title = "title"
    static let MediumURL = "url_m"
  }
  
  // MARK: GitHUB Response Values
  struct GitHUBResponseValues {
    static let OKStatus = "ok"
  }
}
