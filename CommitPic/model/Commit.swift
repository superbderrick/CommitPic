//
//  CommitInformation.swift
//  CommitPic
//
//  Created by derrick on 31/03/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit

class Commit {
  var pushTime:String!
  var repoURL:String!
  var payloadURL:String!
  var languageType:String?
  var detailDateInformation:String!
  var total:Int?
  var additions:Int?
  var deleteions:Int?
  var repoName:String!
	
	
  init(pushTime:String , repoURL:String , payload:String , repoName:String , detailBand:String) {
		self.pushTime = pushTime
		self.repoURL = repoURL
		self.payloadURL = payload
    self.repoName = repoName
    self.detailDateInformation = detailBand
	}
}
