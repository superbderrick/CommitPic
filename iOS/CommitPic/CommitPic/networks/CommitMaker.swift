//
//  CommitMaker.swift
//  CommitPic
//
//  Created by derrick on 28/03/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit
import Firebase

class CommitMaker: NSObject {
	
	var commits = [Commit]()
	var ref: FIRDatabaseReference!
	override init() {
		super.init()
    
    
		self.inserTestDATA()
	}
  
  private func getCommitData() {
    
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
