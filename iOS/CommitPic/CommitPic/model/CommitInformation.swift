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
	
	
	init(pushTime:String , repoURL:String , payload:String) {
		self.pushTime = pushTime
		self.repoURL = repoURL
		self.payloadURL = payload
	}
}
