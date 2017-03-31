//
//  GitHubOAuth.swift
//  CommitPic
//
//  Created by Kang Jinyeoung on 2017. 3. 19..
//  Copyright © 2017년 Superbderrick. All rights reserved.
//

import UIKit


class GitHubOAuth {
  static let shared = GitHubOAuth()
  private init(){}
  
  
  
  func requestAuthenticationWith(parameters: [String : String]){
    var parameterString = String()
    
    for parameter in parameters.values{
      parameterString = parameterString.appendingFormat(parameter)
    }
    
    if let requestURL = NSURL(string: "\(Constants.GithubOAuthInfo.OAuthBaseURL)authorize?client_id=\(Constants.GithubConfidentialInfo.GitHubClientID)&scope=\(parameterString)"){
        print(requestURL)
      
      UIApplication.shared.openURL(requestURL as URL)
    }
  }

}
