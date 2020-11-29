//
//  SearchVC.swift
//  WeatherApp
//
//  Created by admin on 29.11.2020.
//

import UIKit

class SearchVC: UIViewController {
    
    
    
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBtn.layer.cornerRadius = 6
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        cityLabel.text = ""
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        let city = cityLabel.text ?? ""
        
        if city.isEmpty {
            let alert = UIAlertController(title: "NOTICE", message: "Please enter city name", preferredStyle: .alert)
            
            let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(cancelBtn)
            
            self.present(alert, animated: true, completion: nil)
        } else {
            let vc = self.storyboard?.instantiateViewController(identifier: "Weather") as! ViewController
            
            self.show(vc, sender: nil)
        }
    }
    
}
