//
//  ForecastWeather.swift
//  WeatherApp
//
//  Created by admin on 01.12.2020.
//

import Foundation
import Alamofire
import SwiftyJSON


struct ForecastWeather : Decodable {
    var list : [List]?
}

struct List: Decodable {
    var dt: Int?
    var main: Main?
    var weather: [Weather]?
    var dt_txt: String?
}

struct Main: Decodable {
    var temp: Double?
}

struct Weather: Decodable {
    var main: String?
    var description: String?
    var icon: String?
}



