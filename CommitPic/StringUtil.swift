//
//  StringUtil.swift
//  CommitPic
//
//  Created by Kang Jinyeoung on 08/04/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit

class StringUtil {
  static func getRepoName(fullName:String) ->String {
    
    let wholeNameArray = fullName.components(separatedBy: "/")
    let repoName: String = wholeNameArray [1]
    return repoName
  }

}
