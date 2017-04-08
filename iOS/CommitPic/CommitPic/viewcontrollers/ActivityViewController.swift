//
//  ActivityViewController.swift
//  CommitPic
//
//  Created by derrick on 27/03/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit
import EZLoadingActivity
class ActivityViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
	
	@IBOutlet weak var dateSegment: UISegmentedControl!
	@IBOutlet weak var activityTableView: UITableView!
	
	
  var commitArray = [Commit]()
	var commitMaker:CommitMaker!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.activityTableView.dataSource = self
		self.activityTableView.delegate = self
		
		
      
		commitMaker = CommitMaker()
    EZLoadingActivity.show("Loading...", disableUI: true)
      
    
    commitMaker.getCommitInformation().then { commitArray in
      self.attachData(commitArray)
    }.catch { error in
          print(error)
    }
	
    }
  
  func attachData(_ data : [Commit]) -> Void {
      self.commitArray = data
      reloadTableView()
  }
  
  func reloadTableView() {
    performUIUpdatesOnMain {
      EZLoadingActivity.hide(true, animated: false)
      self.activityTableView.reloadData()
    }
  }
	

  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  }
    

	// MARK: - Table view data source
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// Return the number of rows in the section.
		return commitArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cellIdentifier = "ActivityViewCell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ActivityTableViewCell
		
		let commit = commitArray[indexPath.row]
    print(commit.pushTime)
    print(commit.repoName)
    print(commit.languageType!)
    print(commit.detailDateInformation)
    print(commit.additions)
    print(commit.deleteions)
    print(commit.total)
//		cell.contentNameLabel.text = .name
//		cell.contentTypeImageView.image = content.photo
//		cell.contentTypeLabel.text = content.type
		
		
		return cell
	}

}
