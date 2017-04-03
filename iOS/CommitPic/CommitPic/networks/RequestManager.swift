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
	 init() {

			self.getCommitInformation().then {_ in
		
				print("test")
				}.catch {_ in
					print("testff")
			}
	
	}
	func getCommitInformation() -> Promise<String> {
		let urlString = Constants.GitHub.BASE_API_URL + Constants.GithubRequestValue.TEST
		
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
							
						}

					}
					let testtt = "hello"
					if json.count > 0 {
							fulfill(testtt)
					} else {
						reject(response.error!)
					}
				}
				
			}
			
			
		}
	}
	
//	func getCommitInformation() -> Promise<String> {
//		return Promise { fulfill , reject in
//			let urlString = Constants.GitHub.BASE_API_URL + Constants.GithubRequestValue.TEST
//			Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
//						.responseJSON { response in
//			
//							if response.data != nil {
//								let json = JSON(data: response.data!)
//			
//								for index in 0...json.count {
//									let eventType = json[index]["type"].stringValue
//			
//									if eventType == Constants.EventType.PushEvent {
//										let pushTime = json[index]["created_at"].stringValue
//										let repoDic = json[index]["repo"].dictionary!
//										let repoURL = repoDic["url"]?.stringValue
//										let payloadDic = json[index]["payload"].dictionary!
//										let commitDic = payloadDic["commits"]?.array
//										let urlDic = commitDic?[0].dictionary!
//										let finalPayUrl = urlDic?["url"]?.stringValue
//								//		let requestInformation = CommitInformation(pushTime:pushTime , repoURL:repoURL! , payload:finalPayUrl!)
//										
//					
//									}
//									
//								}
//								if json.count > 0 {
//									fulfill("test")
//								} else {
//									reject(response.error!)
//								}
//								
//			
//		}
//
//};
}
