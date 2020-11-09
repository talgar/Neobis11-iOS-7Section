//
//  Networking.swift
//  WeatherApp
//
//  Created by admin on 08.11.2020.
////
//
import Foundation

let API_URL = "http://api.openweathermap.org/data/2.5/weather?lat=42.874722&lon=74.612222&APPID=3331e666239ea2e7435b26c22893307c"

typealias DownloadComplete = () -> ()

//import Alamofire
//import SwiftyJSON
//
//class NetworkManager {
//
//    static let network = NetworkManager()
//
//    class func loadCW(completion: @escaping (CurrentWeather)->()) {
//
//        let jsonURL = "https://api.weatherbit.io/v2.0/current?city=Rust,NC&key=a9218ea8a690411984052d7a011f8e96"
//
//        guard let url = URL(string: jsonURL) else { return }
//
//        Alamofire.request(url).validate().responseJSON {(response) in
//            let result = response.data
//
//            do {
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .secondsSince1970
//                let info = try decoder.decode(CurrentWeather.self, from: result!)
//
//                DispatchQueue.main.async {
//                    completion(info)
//                }
//            } catch let jsonError {
//                print("ERROR...", jsonError)
//            }
//        }
//    }
//
//
//
//
//}
