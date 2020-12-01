//
//  City.swift
//  WeatherApp
//
//  Created by admin on 01.12.2020.
//

import Foundation
import UIKit

class Locations : Codable {
    let name : String?
    
    init(name : String) {
        self.name = name
    }
}

var locationList = [Locations]()


func addLocation(name : String)  {
    locationList.append(Locations(name: name))
    saveData()
}

func removeLocation(at Index : Int) {
    locationList.remove(at: Index)
    saveData()
}

func saveData() {
    UserDefaults.standard.set(try? PropertyListEncoder().encode(locationList), forKey: "city")
}

func loadData() {
    if let data = UserDefaults.standard.value(forKey: "city") as? Data {
        let location = try? PropertyListDecoder().decode(Array<Locations>.self, from: data)
        locationList = location!
    }
}
