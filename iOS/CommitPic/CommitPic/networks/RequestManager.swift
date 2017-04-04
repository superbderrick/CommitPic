//
//  RequestManager.swift
//  CommitPic
//
//  Created by derrick on 03/04/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import PromiseKit

class RequestManager {
  var commitInformationArray = [CommitInformation]()
  init (){
    
    self.getCommitInformation().then { commitArray in
      self.getRepoInformation(commitArray)
      }.then { repoData in
        self.getContiributeInformation(repoData)
      }.then { repoData in
        self.printWholeData()
      }.catch { error in
        print(error)
    }
    
  }
  func printWholeData() {
    
  }
  
  func getContiributeInformation(_ commitArray:[CommitInformation]) -> Promise<[CommitInformation]> {
    var count = 0
    return Promise { fulfill, reject in
      for commit in commitArray {
        Alamofire.request(commit.payload, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
          if response.data != nil {
            
            let json = JSON(data:response.data!)
            let statDic = json["stats"].dictionary!
            let count = statDic["total"]?.int
            let count2 = statDic["additions"]?.int
            let count3 = statDic["deletions"]?.int
            
            print(count!)
            print(count2!)
            print(count3!)
            
            //commitArray[count].RepoName = languageType!
            
            
            
            
            
          } else {
            reject(response.error!)
          }
          
        }
        
      }
      fulfill(commitArray)
      
    }
    
  }
  
  func getRepoInformation(_ commitArray:[CommitInformation]) -> Promise<[CommitInformation]> {
    var count = 0
    return Promise { fulfill, reject in
      for commit in commitArray {
        Alamofire.request(commit.repo, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
          if response.data != nil {
            let json = JSON(data:response.data!)
            let languageType = json["language"].string
            
            
            commitArray[count].RepoName = languageType!
            if count < commitArray.count {
              count += 1
            }
            
          } else {
            reject(response.error!)
          }
          
        }
        
      }
      fulfill(commitArray)
      
    }
    
  }
  
  func getCommitInformation() -> Promise<[CommitInformation]> {
    let urlString = Constants.GitHub.BASE_API_URL + Constants.GithubRequestValue.TEST
    var commitArray = [CommitInformation]()
    return Promise { fulfill, reject in
      
      Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
        if response.data != nil {
          let json = JSON(data:response.data!)
          
          for index in 0...json.count {
            let eventType = json[index]["type"].stringValue
            
            if eventType == Constants.EventType.PushEvent {
              let pushTime = json[index]["created_at"].stringValue
              let repoDic = json[index]["repo"].dictionary!
              let repoURL = repoDic["url"]?.stringValue
              let payloadDic = json[index]["payload"].dictionary!
              let commitDic = payloadDic["commits"]?.array
              let urlDic = commitDic?[0].dictionary!
              let finalPayUrl = urlDic?["url"]?.stringValue
              let requestInformation = CommitInformation(pushTime:pushTime , repoURL:repoURL! , payload:finalPayUrl!)
              commitArray.append(requestInformation)
            }
            
          }
          
          if commitArray.count > 0 {
            fulfill(commitArray)
          } else {
            reject(response.error!)
          }
        }
        
      }
      
      
    }
  }
  
  
}
