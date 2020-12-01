//
//  SearchVC.swift
//  WeatherApp
//
//  Created by admin on 29.11.2020.
//

import UIKit

class AddLocationsVC: UIViewController {

    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var addLocationBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLocationBtn.layer.cornerRadius = 6
        locationLabel.becomeFirstResponder()
    }
        
    @IBAction func addLocationAct(_ sender: Any) {
       
        let newLocation = locationLabel.text
        
        if newLocation != "" {
            addLocation(name : newLocation!)
        } else {
            let alert = UIAlertController(title: "NOTICE", message: "Please enter location name", preferredStyle: .alert)

            let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            alert.addAction(cancelBtn)

            self.present(alert, animated: true, completion: nil)
        }
    }
}
    

        

        
        

        
        
    
    



