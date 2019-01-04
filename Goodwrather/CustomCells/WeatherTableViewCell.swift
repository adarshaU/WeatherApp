//
//  WeatherTableViewCell.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 03/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var tempratureLabel: UILabel!
    
    func configure(_ vm:WeatherViewModel){
        self.cityLabel.text = vm.name.value
        self.tempratureLabel.text = "\(vm.main.temperature.value.formatAsDegree)"
    }

}
