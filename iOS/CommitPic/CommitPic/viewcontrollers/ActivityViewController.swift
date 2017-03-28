//
//  ActivityViewController.swift
//  CommitPic
//
//  Created by derrick on 27/03/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
	
	@IBOutlet weak var dateSegment: UISegmentedControl!
	@IBOutlet weak var activityTableView: UITableView!
	
	
	var commits = [Commit]()
	var commitMaker:CommitMaker!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.activityTableView.dataSource = self
		self.activityTableView.delegate = self
		
		
		commitMaker = CommitMaker()
		commits = commitMaker.getCommitInformation()
		
	
		performUIUpdatesOnMain {
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
		return commits.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cellIdentifier = "ActivityViewCell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ActivityTableViewCell
		
//		let content = contents[indexPath.row]
//		cell.contentNameLabel.text = content.name
//		cell.contentTypeImageView.image = content.photo
//		cell.contentTypeLabel.text = content.type
		
		
		return cell
	}

}
