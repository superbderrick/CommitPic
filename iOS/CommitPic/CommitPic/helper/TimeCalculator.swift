//
//  TimeCalculator.swift
//  CommitPic
//
//  Created by Kang Jinyeoung on 02/04/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit


enum Example {
  case A
  case B
  case C
  case D
}


class TimeCalculator: NSObject {
  static func getTimeInformation(pushTime:String) -> (String, String)  {
    let timeInformaion = "tst"
    
                  //"2017-04-02T03:57:05Z"
    let isoDate = "2016-04-14T10:44:00+0000"
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from:pushTime)!
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
    let finalDate = calendar.date(from:components)

    
    
    return (timeInformaion , timeInformaion)
  }
}
