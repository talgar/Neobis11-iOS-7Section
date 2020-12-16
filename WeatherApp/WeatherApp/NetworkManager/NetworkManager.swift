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

class NetworkManager {
    
    var cityName = ""
    let main = "https://api.openweathermap.org/data/2.5/"
    let key = "0f6112b1d663b03202ffabe9788c51ef"
    let tempType = "&units=metric"
    
    static let shared = NetworkManager()
    
    func loadCurrentWeather( completion: @escaping (CurrentInfo)->() ) {
        
        let jsonUrlString = "\(main)weather?q=\(cityName)\(tempType)&appid=\(key)"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        Alamofire.request(url).validate().responseJSON { (response) in
            let result = response.data
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                let information = try decoder.decode(CurrentInfo.self, from: result!)
                
                DispatchQueue.main.async {
                    completion(information)
                }
            }  catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }
    }
    
    
    func loadForecastWeather( completion: @escaping (ForecastInfo)->()) {
        
        let jsonUrlString = "\(main)forecast?q=\(cityName)\(tempType)&appid=\(key)"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        Alamofire.request(url).validate().responseJSON { (response) in
            let result = response.data
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                let information = try decoder.decode(ForecastInfo.self, from: result!)
                
                DispatchQueue.main.async {
                    completion(information)
                }
            }  catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }
    }
}

