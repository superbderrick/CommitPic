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
  }
  private func withAlmo() {
    let urlString = Constants.GitHub.BASE_API_URL + Constants.GithubRequestValue.TEST
    
    Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
      .responseJSON { response in
        
        if response.data != nil {
          let json = JSON(data: response.data!)
          
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
              
              let (pTime , detailString , num) = TimeCalculator.getTimeInformation(pushTime: pushTime)
              
              self.commitInformationArray.append(requestInformation)
              
            }
          }
          
          for information in self.commitInformationArray {
            //            print(information.pushTime)
            //            print(information.repo)
            //            print(information.payload)
          }
          
        } else {
          print(response.error!)
        }
    }
    
    
  }
  
  private func getCommitData() {
    
    
    let session = URLSession.shared
    let urlString = Constants.GitHub.BASE_API_URL + Constants.GithubRequestValue.TEST
    let url = URL(string:urlString)!
    let request = URLRequest(url:url)
    
    let task = session.dataTask(with: request) {
      (data , response , error) in
      
      guard let statusCode = (response as? HTTPURLResponse)?.statusCode , statusCode >= Constants.GithubResponseStatus.OKStatus && statusCode <= Constants.GithubResponseStatus.ErrorStatus else {
        print("respone Error  \(error)")
        return
      }
      
      guard let data =  data else {
        print("faiuler of data creation  error")
        return
      }
      
      do {
        let userEventsArray = try JSONSerialization.jsonObject(with: data) as? [[String:Any]]
        
        for event in userEventsArray! {
          
          let evenType = event["type"] as! String
          
          if evenType == Constants.EventType.PushEvent {
            
            let pushTime = event["created_at"] as! String
            let repoDic = event["repo"] as! NSDictionary
            let repoURL = repoDic["url"] as! String
            
            let payloadDic = event["payload"] as! NSDictionary
            let commitDic = payloadDic["commits"] as! [[String:Any]]
            
            let urlDic = commitDic[0] as NSDictionary
            let finalPayUrl = urlDic["url"] as! String
            
            let commitInformation = CommitInformation(pushTime:pushTime , repoURL: repoURL , payload:finalPayUrl)
            self.commitInformationArray.append(commitInformation)
          }
        }
        
        for event in self.commitInformationArray {
          print(event.pushTime)
          print(event.repo)
          print(event.payload)
        }
        
        self.secondParsing(dataArray: self.commitInformationArray)
        print("3")
        
      } catch {
        print("Creat json error")
      }
      
    }
    task.resume()
    print("GetDataComplete ")
    
  }
  
  private func thirdParsing(dataArray:[CommitInformation]) {
    //Debug
    for commit in dataArray {
      
      let session = URLSession.shared
      let urlString = commit.payload
      let url = URL(string:urlString!)
      let request = URLRequest(url:url!)
      
      let task = session.dataTask(with: request) {
        (data , response , error) in
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode , statusCode >= Constants.GithubResponseStatus.OKStatus && statusCode <= Constants.GithubResponseStatus.ErrorStatus else {
          print("respone Error  \(error)")
          return
        }
        
        guard let data =  data else {
          print("faiuler of data creation  error")
          return
        }
        
        do {
          let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
          let statDic :NSDictionary = json["stats"] as! NSDictionary
          print(statDic["total"] as! Int)
          print(statDic["additions"] as! Int)
          print(statDic["deletions"] as! Int)
          //					total": 82,
          //					"additions": 59,
          //					"deletions": 23
          
          
        } catch {
          print("Creat json error")
        }
        
      }
      task.resume()
    }
  }
  
  
  
  private func secondParsing(dataArray:[CommitInformation]) {
    //Debug
    var count = 0
    for commit in dataArray {
      
      let session = URLSession.shared
      let urlString = commit.repo
      let url = URL(string:urlString!)
      let request = URLRequest(url:url!)
      
      let task = session.dataTask(with: request) {
        (data , response , error) in
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode , statusCode >= Constants.GithubResponseStatus.OKStatus && statusCode <= Constants.GithubResponseStatus.ErrorStatus else {
          print("respone Error  \(error)")
          return
        }
        
        guard let data =  data else {
          print("faiuler of data creation  error")
          return
        }
        
        do {
          let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
          print(json["language"] as! String)
        } catch {
          print("Creat json error")
        }
        count += 1
        print("4 \(count)")
        
        if(dataArray.count == count) {
          print("Start")
          self.thirdParsing(dataArray: self.commitInformationArray)
        }
        
        
      }
      print("5")
      task.resume()
      
      //self.thirdParsing(dataArray:self.commitInformationArray)
    }
    
    
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
