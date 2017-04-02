//
//  TimeCalculator.swift
//  CommitPic
//
//  Created by Kang Jinyeoung on 02/04/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit


class TimeCalculator: NSObject {
  enum StaticEnum {
    static var someStaticVar = 0
    static func someStaticFunc() {}
  }
  
  enum WorktimeBand {
    static let DaybreakCoding =     "DaybreakCodig"          // 0~ 8     // daybreak
    static let MoringCoding   =     "MoringCoding"           // 8~ 12    // moring
    static let AfternoonCodig  =    "AfternoonCoding"        // 15~ 20   // dinner
    static let NightCodig  =        "NightCoding"            // 20~ 0    //  night
  }
  
  static func getWeekDay(weekDay:Int) ->String {
    var date = ""
    switch weekDay {
    case 1:
      date = "Sunday"
    case 2:
      date = "Monday"
    case 3:
      date = "TuesDay"
    case 4:
      date = "ThursDay"
    case 5:
      date = "Friday"
    case 0:
      date = "Saturday"
    case 0:
      date = "Monday"
    default:
      date = "date"
    }
    
      return date
  }
  
  static func getWorkTimeBand(workTime:Int) ->String {
    
    var test = "test"
    return test
  }
  
  static func getTimeInformation(pushTime:String) -> (String, String , Int)  {
    let timeInformaion = "tst"
    
    let dateFormatter = DateFormatter()
    let tempLocale = dateFormatter.locale // save locale temporarily
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from: pushTime)!
    dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
    dateFormatter.locale = tempLocale // reset the locale
    
    let todayDate = NSDate()
    let calendar = Calendar.current
    
    let todayDay = calendar.component(.day, from: todayDate as Date)
    
    let pushDay = calendar.component(.day, from: date)
    let pushHours = calendar.component(.hour, from: date)
    let pushDate = calendar.component(.weekday, from: date)
    
    let wholedateString = dateFormatter.string(from: date)
    
    print("pushtimedate \(wholedateString)" )
    if pushDay == todayDay {
        print("workTime : \(pushHours)")
    }
      print("pushDate : \(self.getWeekDay(weekDay: pushDate))")
    
    self.getWorkTimeBand(workTime: pushHours)
    
    
 
    
    return (timeInformaion , timeInformaion , StaticEnum.someStaticVar)
  }
}
