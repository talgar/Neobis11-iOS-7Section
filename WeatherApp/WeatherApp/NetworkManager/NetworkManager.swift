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

let currentWeatherURL = "http://api.openweathermap.org/data/2.5/weather?lat=42.874722&lon=74.612222&APPID=3331e666239ea2e7435b26c22893307c"

typealias DownloadComplete = () -> ()


class NetworkManager {
    static let shared = NetworkManager()
    
    func loadForecastWeather( completion:  @escaping (ForecastWeather)->()){
        
        let jsonUrlString = "http://api.openweathermap.org/data/2.5/forecast?lat=42.874722&lon=74.612222&APPID=079587841f01c6b277a82c1c7788a6c3"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        Alamofire.request(url).validate().responseJSON { (response) in
            let result = response.data
            
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                let informations = try decoder.decode(ForecastWeather.self, from: result!)
                
                DispatchQueue.main.async {
                    completion(informations)
                }
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }
    }
    
}
