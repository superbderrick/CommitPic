//
//  Commit.swift
//  CommitPic
//
//  Created by derrick on 27/03/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit

class Commit: NSObject {
	
	var basicPhoto:UIImage = UIImage(named:"Octocat")!
	var basicTitle:String = ""
	
	var date:String = ""
	var detailComment:String = ""
	
	var totalTime:String = ""
	var totalTimePhoto:UIImage  = UIImage(named:"Octocat")!
	
	var languageType:String = ""
	var languageTypePhoto:UIImage  = UIImage(named:"Octocat")!
	
	var commitNum:Int!
	var commitPhoto:UIImage =  UIImage(named:"Octocat")!
	
	var repoName:String = ""
	var repoPhoto:UIImage = UIImage(named:"Octocat")!
	
	
	init?(basicPhoto:  UIImage!, basicTitle: String, date:String,
		  detailComment:String , totalTime:String ,totalTimePhoto: UIImage!
		, languageType:String , languageTypePhoto:UIImage! , commitNum:Int
		, commitPhoto:UIImage! , repoName:String , repoPhoto:UIImage!) {
	
	self.basicPhoto = basicPhoto
	self.basicTitle = basicTitle
	self.date = date
	self.detailComment = detailComment
	self.totalTime = totalTime
	self.totalTimePhoto = totalTimePhoto
	self.languageType = languageType
	self.languageTypePhoto = languageTypePhoto
	self.commitNum = commitNum
	self.commitPhoto = commitPhoto
	self.repoName = repoName
	self.repoPhoto = repoPhoto
		
	}
	
}
