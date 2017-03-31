//
//  CommitInformation.swift
//  CommitPic
//
//  Created by derrick on 31/03/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit

class CommitInformation: NSObject {
	var pushTime:String!
	var repo:String!
	var payload:String!
	
	
	init(pushTime:String , repoURL:String , payload:String) {
		self.pushTime = pushTime
		self.repo = repoURL
		self.payload = payload
	}
}
