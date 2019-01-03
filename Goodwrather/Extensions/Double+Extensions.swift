//
//  Double+Extensions.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 03/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import Foundation

extension Double{
    
    var formatAsDegree:String{
        return String(format: "%.0f°", self)
    }
}
