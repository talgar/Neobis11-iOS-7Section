//
//  ViewController.swift
//  WeatherApp
//
//  Created by admin on 07.11.2020.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var currentWeather : CurrentWeather!
    var dayOrNight = ""

    

    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weekDayLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        currentWeather = CurrentWeather()
        currentWeather.downloadCuerrentWeather {
            self.updateCurrentWeather()
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ForecastWeatherCollectionCell
        
        return cell
    }
    
    
    func updateCurrentWeather() {
        cityLabel.text = currentWeather.city
        tempLabel.text = "\(Int(currentWeather.temp))°"
        descriptionLabel.text = currentWeather.description
        weekDayLabel.text = currentWeather.date
        
        self.dayOrNight = currentWeather.icon


        if dayOrNight.last! == "d" {
            dayOrNight = "d"
            self.dayView()
        } else {
            dayOrNight = "n"
            self.nightView()
        }
        
    }
    
        
    func dayView(){
        backgroundView.image = UIImage(named: "catalinaD")
        iconView.image = UIImage(named:currentWeather.icon)

    }
    
    func nightView(){
        backgroundView.image = UIImage(named: "catalinaN")
        iconView.image = UIImage(named:currentWeather.icon)

    }
    
}


