//
//  Networking.swift
//  WeatherApp
//
//  Created by admin on 08.11.2020.
////
//
import Foundation
import Alamofire
import SwiftyJSON


//var cityName = "Catalina"



//MARK: download func for ForecastWeather



class NetworkManager {
      
//    static let shared = NetworkManager()
//
//    var _city : String!
//    var _date : String!
//    var _icon : String!
//    var _description : String!
//    var _temp : Double!
//
//    var date : String {
//        if _date == nil {
//            _date = ""
//        }
//        return _date
//    }
//
//    var city : String {
//        if _city == nil {
//            _city = ""
//        }
//        return _city
//    }
//
//    var description : String {
//        if _description == nil {
//            _description = ""
//        }
//        return _description
//    }
//
//    var temp : Double {
//        if _temp == nil {
//            _temp = 0.0
//        }
//        return _temp
//    }
//
//    var icon : String {
//        if _icon == nil {
//            _icon = ""
//        }
//        return _icon
//    }
//
//        typealias DownloadComplete = () -> ()
//
//        //MARK: downloadCurrentWeather func
//    func downloadCuerrentWeather(cityName: String, completed: @escaping DownloadComplete){
//            let currentWeatherURL = "https://api.openweathermap.org/data/2.5/weather?q=\(String(describing: cityName))&appid=0f6112b1d663b03202ffabe9788c51ef"
//            Alamofire.request(currentWeatherURL).responseJSON { (response) in
//                let result = response.result
//                let json = JSON(result.value)
//                self._city = json["name"].stringValue
//                let tempDate = json["dt"].double
//                let convertedDate = Date(timeIntervalSince1970: tempDate!)
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateStyle = .medium
//                dateFormatter.timeStyle = .none
//                let currentDate = dateFormatter.string(from: convertedDate)
//                self._date = "\(currentDate)"
//                self._description = json["weather"][0]["main"].stringValue
//                let downloadedTemp = json["main"]["temp"].double
//                self._temp = (downloadedTemp! - 273.15).rounded(places: 0)
//                self._icon = json["weather"][0]["icon"].stringValue
//                print(self._city, self._temp)
//                completed()
//            }
//        }
//

   var model = Model()
    
    
    }
    

