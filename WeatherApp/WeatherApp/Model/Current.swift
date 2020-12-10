//
//  Current.swift
//  WeatherApp
//
//  Created by admin on 11.12.2020.
//

import Foundation

struct CurrentWeather {
    var current = [CurrentInfo]()
}

struct CurrentInfo : Codable {
    var weather : [WeatherC]?
    var main : [MainC]?
    var dt : Int?
    var name : String?
}

struct WeatherC : Codable {
    let main : String?
    let description : String?
    let icon : String?
}

struct MainC : Codable {
    let temp : Double?
}

