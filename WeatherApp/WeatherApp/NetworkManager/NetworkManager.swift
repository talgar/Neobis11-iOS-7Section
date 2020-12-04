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
    
    var modelCurrent = ModelCurrent()
    var modelForecast = ModelForecast()
    
    func loadCurrentWeather(cityName: String, completed: @escaping () -> ()) {
        let jsonUrlString = "https://api.openweathermap.org/data/2.5/weather?q=\(String(describing: cityName))&appid=0f6112b1d663b03202ffabe9788c51ef"
         
        guard let url = URL(string : jsonUrlString) else { return }
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            }
            do {
                let result = try JSONDecoder().decode(CurrentWeather.self, from: data ?? Data())
                
                self.modelCurrent.current.append(result)
            } catch {
                print("Error")
            }
        }.resume()
    }
    
    func loadForecastWeather(cityName: String, completed: @escaping () -> ()) {

        let jsonUrlString = "http://api.openweathermap.org/data/2.5/forecast?q=\(String(describing: cityName))&appid=0f6112b1d663b03202ffabe9788c51ef"

        guard let url = URL(string: jsonUrlString) else { return }
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            }
            do {
                let result = try JSONDecoder().decode(ForecastWeather.self, from: data ?? Data())
                
                self.modelForecast.forecats.append(result)
                
            } catch {
                print("Error")
            }
        }.resume()

    }
}
    

