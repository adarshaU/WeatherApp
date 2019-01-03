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
    
    mutating func addWeatherViewModel(vm:WeatherViewModel){
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section:Int)->Int{
        return self.weatherViewModels.count
    }
    
    func modelAt(index:Int)->WeatherViewModel{
        return self.weatherViewModels[index]
    }
}

struct WeatherViewModel:Codable{
    let name:String
    let main:TemperatureViewModel
}

struct TemperatureViewModel:Codable {
    
    let temperature:Double
    let temperatureMin:Double
    let temperatureMax:Double
    
    enum CodingKeys: String,CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
    
}
