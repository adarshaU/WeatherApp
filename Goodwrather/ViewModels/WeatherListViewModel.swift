//
//  WeatherListViewModel.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 03/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import Foundation


class WeatherListViewModel{
    
    private var weatherViewModels = [WeatherViewModel]()
    
     func addWeatherViewModel(vm:WeatherViewModel){
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section:Int)->Int{
        return self.weatherViewModels.count
    }
    
    func modelAt(index:Int)->WeatherViewModel{
        return self.weatherViewModels[index]
    }
    
     func updateUnit(to:Unit){
        switch to {
        case .celsius:
            self.toCelsius()
        case .fahrenheit:
            self.tofahrenheit()
        }
    }
    
     private func toCelsius(){
        
      weatherViewModels =  weatherViewModels.map{ vm in
            let model = vm
            model.main.temperature.value =  (model.main.temperature.value - 32) * 5/9
            return model
        }
        
    }
     private func tofahrenheit(){
        
        weatherViewModels =  weatherViewModels.map{ vm in
            let model = vm
            model.main.temperature.value =  (model.main.temperature.value * 9/5) + 32
            return model
        }
    }
}


struct WeatherViewModel:Codable{
    var name:Dynamic<String>
    var main:TemperatureViewModel
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = Dynamic(try container.decode(String.self, forKey: .name))
        main = try container.decode(TemperatureViewModel.self, forKey: .main)
    }
}

struct TemperatureViewModel:Codable {
    
    var temperature:Dynamic<Double>
    let temperatureMin:Dynamic<Double>
    let temperatureMax:Dynamic<Double>
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
      //This line of code simply returns the value of key temperature  "container.decode(Double.self, forKey: .temperature)"
        temperature = Dynamic(try container.decode(Double.self, forKey: .temperature))
        temperatureMin = Dynamic(try container.decode(Double.self, forKey: .temperatureMin))
        temperatureMax = Dynamic(try container.decode(Double.self, forKey: .temperatureMax))
    }
    
    enum CodingKeys: String,CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}

class Dynamic<T>:Codable where T:Codable{
    
    typealias Listener = (T)->()
    var listener:Listener?
    
    var value:T{
        didSet{
            listener?(value)
        }
    }
    
    init(_ value :T) {
        self.value = value
    }
    
    func bind(listener:@escaping Listener){
        self.listener = listener
        self.listener?(self.value)
    }
    
    private enum CodingKeys:CodingKey{
        case value
    }
}
