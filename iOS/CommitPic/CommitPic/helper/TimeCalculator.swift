//
//  TimeCalculator.swift
//  CommitPic
//
//  Created by Kang Jinyeoung on 02/04/2017.
//  Copyright © 2017 Superbderrick. All rights reserved.
//

import UIKit

public enum WorktimeBand {
  
  case MoringCoding
  case AfternoonCodig
  case NightCodig
  case DayBreakCoding
  
  var workTimeBandType: String {
    switch self {
    case .MoringCoding:
      return "MoringCoding"
    case .AfternoonCodig:
      return "AfternoonCodig"
    case .NightCodig:
    return "NightCoding"
    case .DayBreakCoding:
      return "DayBreakCoding"
  }
}
}
class TimeCalculator {

  
  static func getWeekDay(weekDay:Int) ->String {
    var date = ""
    print(weekDay)
    switch weekDay {
    case 1:
      date = "Sunday"
    case 2:
      date = "Monday"
    case 3:
      date = "TuesDay"
    case 4:
      date = "WensDay"
    case 5:
      date = "Thursday"
    case 6:
      date = "Friday"
    case 7:
      date = "Saturday"
    default:
      date = "date"
    }
    
      return date
  }
  
  static func getWorkTimeBand(workTime:Int) ->String {
    
    var test = "test"
    return test
  }
  
  static func getTimeInformation(pushTime:String) -> (String)  {
    var timeInformaion = "date"
    
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
    
//    print("pushtimedate \(wholedateString)" )
//    if pushDay == todayDay {
//        print("workTime : \(pushHours)")
//    }
    timeInformaion = wholedateString + "\(self.getWeekDay(weekDay: pushDate))"
    
 
    
    return (timeInformaion)
  }
}
