//
//  CommitInformation.swift
//  CommitPic
//
//  Created by derrick on 31/03/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit

class CommitInformation {
  var pushTime:String!
  var repoURL:String!
  var payloadURL:String!
  var repoName:String?
  var detailDateInformation:String!
  var total:Int?
  var additions:Int?
  var deleteions:Int?
	
	
  init(pushTime:String , repoURL:String , payload:String , detailDateInfo:String) {
		self.pushTime = pushTime
		self.repoURL = repoURL
		self.payloadURL = payload
    self.detailDateInformation = detailDateInfo
	}
}
