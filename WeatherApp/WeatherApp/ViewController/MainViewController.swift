//
//  ViewController.swift
//  WeatherApp
//
//  Created by admin on 07.11.2020.
//

import UIKit
import Alamofire

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var dayOrNight = ""
    var dayList: [List] = []
    var nightList: [List] = []
    var dt: Int = 0
    
    
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        loadCurrentWeather()
        loadForecastWeather()
    }

    
    func loadCurrentWeather(){
        NetworkManager.shared.loadCurrentWeather(completion: updateCurrentWeather)
    }
    
    func loadForecastWeather(){
        NetworkManager.shared.loadForecastWeather(completion: updateForecastWeather)
    }
    
    func updateCurrentWeather(information: CurrentInfo) {
        
        cityLabel.text = information.name
        tempLabel.text =  "\(Int((information.main?.temp)!))°C"
        descriptionLabel.text = (information.weather?[0].main)
        dateLabel.text = information.dt?.convertToWD(dt)

        self.dayOrNight = (information.weather?[0].icon)!
        
            if dayOrNight.last! == "d" {
                dayOrNight = "d"
                backgroundView.image = UIImage(named: "catalinaD")
                iconView.image = UIImage(named: (information.weather?[0].icon)!)!
            } else {
                dayOrNight = "n"
                backgroundView.image = UIImage(named: "catalinaN")
                iconView.image = UIImage(named: (information.weather?[0].icon)!)!
            }
    }
    
    func updateForecastWeather(info: ForecastInfo) {
        
        self.dt = info.list![0].dt!
        
        for item in info.list! {
            if item.dt_txt!.suffix(8) == "15:00:00" {
                self.dayList.append(item)
            } else if item.dt_txt!.suffix(8) == "03:00:00" {
                self.nightList.append(item)
            }
        }
        self.collectionView.reloadData()
    }
    
    
    //MARK: CollectionView for ForecastWeather
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ForecastWeatherCollectionCell
        
        if dayList.isEmpty {
            return cell
        }
        
        cell.layer.cornerRadius = 16
        cell.dayTempLabel.text = "\(Int(((dayList[indexPath.row].main?.temp!)!)))°"
        cell.nightTempLabel.text = "\(Int(((nightList[indexPath.row].main?.temp!)!)))°"
        cell.weekDayLabel.text = dt.convertToWD(indexPath.row)
        cell.forecastWImageView.image = UIImage(named:(dayList[indexPath.row].weather?[0].icon)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 180, height: 120)
    }
}


