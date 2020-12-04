//
//  Model.swift
//  WeatherApp
//
//  Created by admin on 08.11.2020.
//

import Foundation
import Alamofire
import SwiftyJSON


struct CurrentModel {
    var current = CurrentWeather.self
}

class CurrentWeather : Codable {
    
    var city : String!
    var date : String!
    var icon : String!
    var description : String!
    var temp : Double
}



