//
//  AddCityWeatherViewController.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 03/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import UIKit

class AddCityWeatherViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
        if let city = cityNameTextField.text{
            
            let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London&appid=2e03e8ae7fac863d9622ee2d2ca6937d&units=imperial")!
            
            let weatherResoruces = Resource<Any>(url:url){ data in
                return data
            }
            
            
            Webservice().load(resources: weatherResoruces) { (data) in
                
            }
            
            
            
        }
        
        
        
    }
    
}
