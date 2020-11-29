//
//  ViewController.swift
//  WeatherApp
//
//  Created by admin on 07.11.2020.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var currentWeather : CurrentWeather!
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .clear
    }
    
    
    //MARK: load funcs
    
    func loadCurrentWeather() {
        currentWeather = CurrentWeather()
        currentWeather.downloadCuerrentWeather {
            self.updateCurrentWeather()
        }
    }
    
    func loadForecastWeather() {
        NetworkManager.shared.loadForecastWeather(completion: updateForecastWeather)
    }
    
    
    //MARK: Update funcs
    
    func updateCurrentWeather() {
        cityLabel.text = currentWeather.city
        tempLabel.text = "\(Int(currentWeather.temp))°C"
        descriptionLabel.text = currentWeather.description
        dateLabel.text = currentWeather.date

        self.dayOrNight = currentWeather.icon

        if dayOrNight.last! == "d" {
            dayOrNight = "d"
            self.dayView()
        } else {
            dayOrNight = "n"
            self.nightView()
        }
    }
    
    func updateForecastWeather(info: ForecastWeather) {
        
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
        cell.dayTempLabel.text = dayList[indexPath.row].main!.temp!.convertToCelsius()
        cell.nightTempLabel.text = nightList[indexPath.row].main!.temp!.convertToCelsius()
        cell.weekDayLabel.text = dt.convertToWD(indexPath.row)
        cell.forecastWImageView.image = UIImage(named:dayList[indexPath.row].weather![0].icon!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 180, height: 120)
    }
    
    
    //MARK: funcs for backView and weather icon
    
    func dayView(){
        backgroundView.image = UIImage(named: "catalinaD")
        iconView.image = UIImage(named:currentWeather.icon)
    }
    
    func nightView(){
        backgroundView.image = UIImage(named: "catalinaN")
        iconView.image = UIImage(named:currentWeather.icon)
    }
}


