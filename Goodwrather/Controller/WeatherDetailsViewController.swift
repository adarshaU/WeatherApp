//
//  WeatherDetailsViewController.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 04/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    
    var weatherViewModel:WeatherViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let weatherVM = weatherViewModel{
            cityLabel.text = weatherVM.name
            currentTempLabel.text = weatherVM.main.temperature.formatAsDegree
            maxTemperatureLabel.text = weatherVM.main.temperatureMax.formatAsDegree
            minTemperatureLabel.text = weatherVM.main.temperatureMin.formatAsDegree
        }
        
    }
    

}
