//
//  CommitMaker.swift
//  CommitPic
//
//  Created by derrick on 28/03/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit
import Firebase
import Alamofire
import SwiftyJSON
import PromiseKit

class CommitMaker{
  
  var commitInformationArray = [Commit]()
  
  var requestManager:RequestManager!
  
  init() {
    requestManager = RequestManager()
    print("init")
  }
  
  
  func getCommitInformation() ->  Promise<[Commit]> {
    return Promise { fulfill, reject in
      self.requestManager.getCommitData().then { commitArray in
        fulfill(commitArray)
        }.catch { error in
          print(error)
      }
    }
  
  }
}
  


