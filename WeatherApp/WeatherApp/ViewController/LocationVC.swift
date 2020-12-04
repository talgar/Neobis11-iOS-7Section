//
//  TableViewController.swift
//  WeatherApp
//
//  Created by admin on 01.12.2020.
//

import UIKit

class LocationVC: UITableViewController {

    let network = NetworkManager()
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.tableFooterView = UIView()
        loadData()
           
    }
    
    @IBAction func unwinFromAddLocation(segue: UIStoryboardSegue) {
        let source = segue.source as! AddLocationsVC
        //print(source.locationName)
        network.downloadCuerrentWeather(cityName: source.locationName) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print("DONE \(NetworkManager.shared.description)")
        }
        loadForecastWeather(cityName: source.locationName) {
            DispatchQueue.main.async {
                print("DONE \(source.locationName)")
                print("SHOW HERE GETTING JSON\(self.network.model.forecats)")
            }
        }
    }
    
    var model = Model()
    
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
                
                self.model.forecats.append(result)
                
            } catch {
                print("Error")
            }
            
            
        }.resume()
//        Alamofire.request(jsonUrlString).responseJSON { (response) in
//            let result = response.result
//
//            var forecastArray : [ForecastWeather] = []
//
//            if result.isSuccess {
//                completed(forecastArray)
//            } else {
//                completed(forecastArray)
//                print("No forecast")
//            }
//
        }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Locations"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24)]
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return locationList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let location = locationList[indexPath.row]
        
        cell.textLabel!.text = location.name
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            removeLocation(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {}
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
       
        if tableView.isEditing {
            return .none
        } else {
             return .delete
        }
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
