//
//  WeatherListViewModel.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 03/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import Foundation


struct WeatherListViewModel{
    
    private var weatherViewModels = [WeatherViewModel]()
    
}


struct WeatherViewModel{
    let name:String
    let temperature:Double
    let temperatureMin:Double
    let temperatureMax:Double
}
