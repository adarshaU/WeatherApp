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
    
    mutating func updateUnit(to:Unit){
        switch to {
        case .celsius:
            self.toCelsius()
        case .fahrenheit:
            self.tofahrenheit()
        }
    }
    
    mutating private func toCelsius(){
        
      weatherViewModels =  weatherViewModels.map{ vm in
            var model = vm
            model.main.temperature =  (model.main.temperature - 32) * 5/9
            return model
        }
        
    }
    mutating private func tofahrenheit(){
        
        weatherViewModels =  weatherViewModels.map{ vm in
            var model = vm
            model.main.temperature =  (model.main.temperature * 9/5) + 32
            return model
        }
        
    }
    
}

struct WeatherViewModel:Codable{
    let name:String
    var main:TemperatureViewModel
}

struct TemperatureViewModel:Codable {
    
    var temperature:Double
    let temperatureMin:Double
    let temperatureMax:Double
    
    enum CodingKeys: String,CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
    
}
