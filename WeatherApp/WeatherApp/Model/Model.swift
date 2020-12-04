//
//  ForecastWeather.swift
//  WeatherApp
//
//  Created by admin on 01.12.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Model {
    var forecats = [ForecastWeather]()
}

struct ForecastWeather : Codable {
    var list : [List]?
}

struct CurrentWeather: Codable {
    var weather:[Weather]?
    var main: Main?
    var dt: Int?
    var city : City
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

struct City: Decodable {
    var name: String?
}


