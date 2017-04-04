//
//  CommitMaker.swift
//  CommitPic
//
//  Created by derrick on 28/03/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit
import Firebase
import Alamofire
import SwiftyJSON
import PromiseKit

class CommitMaker{
  
  var commits = [Commit]()
  var commitInformationArray = [CommitInformation]()
  
  var requestManager:RequestManager!
  
  init() {
    requestManager = RequestManager()
    requestManager.getCommitData()
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
