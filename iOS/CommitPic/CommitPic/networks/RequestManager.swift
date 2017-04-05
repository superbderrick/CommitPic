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
  
  }
  
  func showWholeData(_ finalArray:[CommitInformation]) {
    for commit in finalArray {
      print("Whole DataNum : \(finalArray.count)")
      print("repoName  : \(commit.repoName)")
      print("total  : \(commit.total)")
      print("add  : \(commit.additions)")
      print("delete  : \(commit.deleteions)")
      print("pushTime  : \(commit.pushTime)")
    }
    
    
  }
  
  func getCommitData() {
    self.getCommitInformation().then { commitArray in
      self.getRepoInformation(commitArray)
      }.then { repoData in
        self.getContiributeInformation(repoData)
      }.then { finalArray in
        self.showWholeData(finalArray)
      }.catch { error in
        print(error)
    }

  }
  

  
  func getContiributeInformation(_ commitArray:[CommitInformation]) -> Promise<[CommitInformation]> {
    var count = 0
    return Promise { fulfill, reject in
      for commit in commitArray {
        Alamofire.request(commit.payloadURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
          if response.data != nil {
            
            let json = JSON(data:response.data!)
            let statDic = json["stats"].dictionary!
            let total = statDic["total"]?.int
            let additions = statDic["additions"]?.int
            let deletions = statDic["deletions"]?.int
            
            
            commitArray[count].total = total!
            commitArray[count].additions = additions!
            commitArray[count].deleteions = deletions!
            
            
            
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
  
  func getRepoInformation(_ commitArray:[CommitInformation]) -> Promise<[CommitInformation]> {
    var count = 0
    return Promise { fulfill, reject in
      for commit in commitArray {
        Alamofire.request(commit.repoURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            if response.data != nil {
              let json = JSON(data:response.data!)
              let languageType = json["language"].string
              commitArray[count].repoName = languageType!
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
              
              let fPushtime = TimeCalculator.getTimeInformation(pushTime: pushTime)
              let requestInformation = CommitInformation(pushTime:fPushtime , repoURL:repoURL! , payload:finalPayUrl! ,detailDateInfo:"test")
              commitArray.append(requestInformation)
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
