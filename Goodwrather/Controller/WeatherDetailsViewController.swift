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
        self.setupBinings()
    }
    
    private func setupBinings(){
        if let weatherVM = weatherViewModel{
            weatherVM.name.bind {
                self.cityLabel.text = $0
            }
            weatherVM.main.temperature.bind{self.currentTempLabel.text = $0.formatAsDegree}
            weatherVM.main.temperatureMin.bind{self.minTemperatureLabel.text = $0.formatAsDegree}
            weatherVM.main.temperatureMax.bind{self.maxTemperatureLabel.text = $0.formatAsDegree}
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.weatherViewModel?.name.value = "Anekal"
        }
    }
}
