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


var cityName = "Catalina"

let currentWeatherURL = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=0f6112b1d663b03202ffabe9788c51ef"

typealias DownloadComplete = () -> ()

//MARK: download func for ForecastWeather 

class NetworkManager {
        
    static let shared = NetworkManager()
    
    func loadForecastWeather( completion:  @escaping (ForecastWeather)->()){
        
        let jsonUrlString = "http://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=0f6112b1d663b03202ffabe9788c51ef"
        
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

