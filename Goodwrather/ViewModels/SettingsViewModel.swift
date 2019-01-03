//
//  SettingsViewModel.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 03/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import Foundation

enum Unit:String,CaseIterable{
    case celsius = "metric"
    case fahrenheit = "imperial"
}

struct SettingsViewModel {
    let units = Unit.allCases
    private var _selectedUnit:Unit = Unit.fahrenheit
    
    var selectedUnit:Unit{
        get{
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "unit") as? String{
                return Unit(rawValue: value)!
            }
            return _selectedUnit
        }set (newValue){
        let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}

extension Unit{
    var displayName:String{
        get{
            switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

