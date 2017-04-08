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
  
  private static func getWorkBand(_ workTime:Int) ->String {
    var workBand = ""
    switch workTime {
    case 0..<7:
      workBand = "DayBreakCoding"
    case 7..<12:
      workBand = "MoringCoding"
    case 12..<14:
      workBand = "LunchCoding"
    case 14..<19:
      workBand = "AfternoonCoding"
    case 19..<24:
      workBand = "NightCoding"
    default:
      workBand = "CodingTime"
    }
    return workBand
  }
  
  
  
   static func getDetail(_ previousTime:String) -> String {
    
    var finalDetail = ""
    var weekDate = ""
    var workBand = ""
    if let time = previousTime as String? { //unwapping
      let calendar = Calendar.current
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
      let date = dateFormatter.date(from: time)!
      let pushDate = calendar.component(.weekday, from: date)
      let pushHours = calendar.component(.hour, from: date)
      weekDate = self.getWeekDay(weekDay: pushDate)
      workBand = self.getWorkBand(pushHours)
      finalDetail = weekDate + " " + workBand
    }else{
      finalDetail = "test"
    }
    return finalDetail
  }
  
  static func getTimeInformation(pushTime:String) -> (String)  {
    
    let dateFormatter = DateFormatter()
    let tempLocale = dateFormatter.locale // save locale temporarily
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from: pushTime)!
    dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
    dateFormatter.locale = tempLocale // reset the locale
    
    let wholedateString = dateFormatter.string(from: date)
    
    return (wholedateString)
  }
}
