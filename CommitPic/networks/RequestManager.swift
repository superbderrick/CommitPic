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

public enum CommitRange {
  case Today
  case Week
}

class RequestManager {
  var commitInformationArray = [Commit]()
  var range:CommitRange!
  init (_ range:CommitRange){
    self.range = range
  }
  
  
  func getCommitData() ->  Promise<[Commit]> {
    return Promise { fulfill, reject in
          self.getCommitInformation().then { commitArray in
            self.getRepoInformation(commitArray)
            }.then { repoData in
              self.getContiributeInformation(repoData)
            }.then { finalArray in
              fulfill(finalArray)
            }.catch { error in
              print(error)
          }
    }

  }
  

  
  func getContiributeInformation(_ commitArray:[Commit]) -> Promise<[Commit]> {
    var count = 0
    var total = 0
    var additions = 0
    var deletions = 0
    return Promise { fulfill, reject in
      for commit in commitArray {
        Alamofire.request(commit.payloadURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
          if response.data != nil {
            
            let json = JSON(data:response.data!)
            
            if let statDic = json["stats"].dictionary {
              
               total = (statDic["total"]?.int)!
               additions = (statDic["additions"]?.int)!
               deletions = (statDic["deletions"]?.int)!
            }
            commitArray[count].total = total
            commitArray[count].additions = additions
            commitArray[count].deleteions = deletions
            
            
            if count < commitArray.count {
              count += 1
            }
            if count == commitArray.count {
              fulfill(commitArray)
              print("Done third Request")
            }
            
          } else {
            reject(response.error!)
          }
          
        }
        
      }
      
     
    }
    
  }
  
  func getRepoInformation(_ commitArray:[Commit]) -> Promise<[Commit]> {
    var count = 0
    return Promise { fulfill, reject in
      for commit in commitArray {
        Alamofire.request(commit.repoURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            if response.data != nil {
              let json = JSON(data:response.data!)
              let languageType = json["language"].string
              commitArray[count].languageType = languageType!
              if count < commitArray.count {
              count += 1
              }
              
              if count == commitArray.count {
                fulfill(commitArray)
                print("Done second Request")
              }
          } else {
            reject(response.error!)
          }
          
        }
        
        
      }
      
      
    }
    
  }
  
  func getCommitInformation() -> Promise<[Commit]> {
    let urlString = Constants.GitHub.BASE_API_URL + Constants.GithubRequestValue.TEST
    var commitArray = [Commit]()
    return Promise { fulfill, reject in
      
      Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
        if response.data != nil {
          let json = JSON(data:response.data!)
          
          for index in 0...json.count {
            let eventType = json[index]["type"].stringValue
            
            if eventType == Constants.EventType.PushEvent {
              let pushTime = json[index]["created_at"].stringValue
              
              if TimeCalculator.checkToday(pushTime: pushTime) {
                let repoDic = json[index]["repo"].dictionary!
                let repoURL = repoDic["url"]?.stringValue
                let repoName = repoDic["name"]?.stringValue
                let payloadDic = json[index]["payload"].dictionary!
                let commitDic = payloadDic["commits"]?.array
                let urlDic = commitDic?[0].dictionary!
                let finalPayUrl = urlDic?["url"]?.stringValue
                
                let fPushtime = TimeCalculator.getTimeInformation(pushTime: pushTime)
                let requestInformation = Commit(pushTime:fPushtime , repoURL:repoURL!
                  , payload:finalPayUrl! ,repoName:StringUtil.getRepoName(fullName: repoName!) ,detailBand:TimeCalculator.getDetail(fPushtime))
                commitArray.append(requestInformation)
              }
              
              
            }
            
          }
          
          if commitArray.count > 0 {
            fulfill(commitArray)
            print("Done first Request")
          } else {
            reject(response.error!)
          }
        }
        
      }
      
      
    }
  }
  
  
}
