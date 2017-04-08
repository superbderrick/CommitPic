//
//  ActivityTableViewCell.swift
//  CommitPic
//
//  Created by derrick on 24/03/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

  @IBOutlet weak var pushDate: UILabel!
  @IBOutlet weak var detailLabel: UILabel!
  @IBOutlet weak var repoName: UILabel!
  @IBOutlet weak var languageName: UILabel!
  @IBOutlet weak var addtion: UILabel!
  @IBOutlet weak var delete: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
