//
//  ForecastWeather.swift
//  WeatherApp
//
//  Created by admin on 01.12.2020.
//

import Foundation

struct ModelForecast {
    var forecats = [ForecastWeather]()
}

struct ModelCurrent {
    var current = [CurrentWeather]()
}

struct ForecastWeather : Codable {
    var list : [List]?
}

struct CurrentWeather : Codable {
    var weather:[Weather]?
    var main: Main?
    var dt: Int?
    var city : City?
}

struct List: Codable {
    var dt: Int?
    var main: Main?
    var weather: [Weather]?
    var dt_txt: String?
}

struct Main: Codable {
    var temp: Double?
}

struct Weather: Codable {
    var main: String?
    var description: String?
    var icon: String?
}

struct City: Codable {
    var name: String?
}


