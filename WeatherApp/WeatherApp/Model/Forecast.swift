//
//  ForecastWeather.swift
//  WeatherApp
//
//  Created by admin on 01.12.2020.
//

import Foundation

struct ForecastInfo : Decodable {
    var list : [List]?
}

struct List: Decodable {
    var dt: Int?
    var main: MainF?
    var weather: [WeatherF]?
    var dt_txt: String?
}

struct MainF : Decodable {
    var temp : Double?
}

struct WeatherF : Decodable {
    var icon : String?
    var main : String?
}



