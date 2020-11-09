//
//  Model.swift
//  WeatherApp
//
//  Created by admin on 08.11.2020.
//

import Foundation
import SwiftyJSON
import Alamofire

class CurrentWeather {
    
    private var _date : String!
    private var _city : String!
    private var _description : String!
    private var _temp : Double!
    private var _icon : String!
    
    
    var date : String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var city : String {
        if _city == nil {
            _city = ""
        }
        return _city
    }
    
    var description : String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var temp : Double {
        if _temp == nil {
            _temp = 0.0
        }
        return _temp
    }
    
    var icon : String {
        if _icon == nil {
            _icon = ""
        }
        return _icon
    }
    
    func downloadCuerrentWeather(completed: @escaping DownloadComplete){
        Alamofire.request(API_URL).responseJSON { (response) in
           //print(response)
            let result = response.result
            //print(result.value)
            let json = JSON(result.value)
            self._city = json["name"].stringValue
            let tempDate = json["dt"].double
            let convertedDate = Date(timeIntervalSince1970: tempDate!)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            let currentDate = dateFormatter.string(from: convertedDate)
            self._date = "\(currentDate)"
            self._description = json["weather"][0]["main"].stringValue
            let downloadedTemp = json["main"]["temp"].double
            self._temp = (downloadedTemp! - 273.15).rounded(places: 0)
            self._icon = json["weather"][0]["icon"].stringValue
            completed()
        }
    }
}

