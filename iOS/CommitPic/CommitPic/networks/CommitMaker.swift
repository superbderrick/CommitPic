//
//  CommitMaker.swift
//  CommitPic
//
//  Created by derrick on 28/03/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit
import Firebase

class CommitMaker: NSObject {
  
  var commits = [Commit]()
  override init() {
    super.init()
    
    self.getCommitData()
    //self.inserTestDATA()
  }
  
  private func getCommitData() {
    let session = URLSession.shared
    let urlString = Constants.GitHub.BASE_API_URL + Constants.GitHUBRequestValue.TEST
    let url = URL(string:urlString)!
    let request = URLRequest(url:url)
    
    let task = session.dataTask(with: request) {
      (data , response , error) in
      
      func showError(_ error:String) {
        print("Derrick : Test \(error)")
      }
      
      guard let statusCode = (response as? HTTPURLResponse)?.statusCode , statusCode >= 200 && statusCode <= 299 else {
        print("Derrick : response  \(error)")
        return
      }
      
      guard let data =  data else {
        print("Derrick data error")
        return
      }
      do {
          let userEventsArray = try JSONSerialization.jsonObject(with: data) as? [[String:Any]]
        
          for dict in userEventsArray! {
          
            let test = dict["type"] as! String
            
          if test == "PushEvent" {
              print(dict["created_at"])
          }
          
        }
        
      } catch {
        print("Creat json error")
      }
      
      
      
    }
    task.resume()
    
  }
  
  private func inserTestDATA () {
    for i in 0..<3 {
      print("(i)")
      let testImage = UIImage(named:"Octocat")
      let testString = "Hello"
      
      let commit = Commit(basicPhoto: testImage,basicTitle: testString,date: testString ,
                          detailComment: testString , totalTime: testString , totalTimePhoto: testImage ,
                          languageType: testString,languageTypePhoto: testImage ,commitNum:  i , commitPhoto: testImage ,repoName: testString ,repoPhoto: testImage)
      
      commits.append(commit!)
    }
    
  }
  
	 func getCommitInformation() -> [Commit]{
    
    return self.commits
  }
}
