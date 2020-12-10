//
//  ForecastWeather.swift
//  WeatherApp
//
//  Created by admin on 01.12.2020.
//

import Foundation

struct ForecastWeather {
    var forecast = [ForecastInfo]()
}

struct ForecastInfo : Codable {
    let list : [List]?
}

struct List: Codable {
    let dt: Int?
    let main: [MainF]?
    let weather: [WeatherF]?
    let dt_txt: String?
}

struct MainF : Codable {
    let temp : Double?
}

struct WeatherF : Codable {
    let icon : String?
}



