//
//  Current.swift
//  WeatherApp
//
//  Created by admin on 11.12.2020.
//

import Foundation

struct CurrentInfo : Decodable {
    var weather : [WeatherC]?
    var main : MainC?
     var dt : Int?
    var name : String?
}

struct WeatherC : Decodable {
    var main : String?
    var description : String?
    var icon : String?
}

struct MainC : Decodable {
    var temp : Double?
}

