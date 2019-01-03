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

