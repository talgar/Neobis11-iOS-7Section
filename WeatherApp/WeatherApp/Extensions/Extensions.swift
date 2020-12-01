//
//  Extension.swift
//  WeatherApp
//
//  Created by admin on 09.11.2020.
//
//
import Foundation

extension Double {
    
    //MARK: func for temp
    
    func rounded(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func convertToCelsius() -> String {
        let fahrenheit = Int(self) - 273
        if fahrenheit < 0 {
            return "\(fahrenheit)°"
        }
        if self > 0 {
            return "\(fahrenheit)°"
        }
        return "\(fahrenheit)°"
    }
}

extension Date {
    
    //MARK: func for date
    
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

extension Int {
    
    //MARK: func for weekdays
    
    func convertToWD(_ num: Int) -> String {
        return unixTimeToWD(unixTime: Double(self), offset: num)
    }
}

    func unixTimeToWD(unixTime: Double, timeZone: String = "Kazakhstan/Almaty", offset: Int) -> String {
        if(timeZone == "" || unixTime == 0.0) {
            return ""
        } else {
            let time = Date(timeIntervalSince1970: unixTime)
            var cal = Calendar(identifier: .gregorian)
            if let tz = TimeZone(identifier: timeZone) {
                cal.timeZone = tz
            }
            
            let weekday = (cal.component(.weekday, from: time) + offset - 1 ) % 7

            return Calendar.current.weekdaySymbols[weekday]
        }
    }



