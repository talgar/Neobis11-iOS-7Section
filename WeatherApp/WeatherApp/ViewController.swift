//
//  ViewController.swift
//  WeatherApp
//
//  Created by admin on 07.11.2020.
//

import UIKit

class ViewController: UIViewController {

    var currentWeather : CurrentWeather!
    var dayOrNight = ""
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weekDayLabel: UILabel!
    @IBOutlet weak var changeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentWeather = CurrentWeather()
        currentWeather.downloadCuerrentWeather {
            self.updateCurrentWeather()
        }
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
        changeView.backgroundColor = UIColor.systemTeal
        imageView.image = UIImage(named: "day")
    }
    
    func nightView(){
        changeView.backgroundColor = UIColor.secondaryLabel
        imageView.image = UIImage(named: "night")
    }
    
}


