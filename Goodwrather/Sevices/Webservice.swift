//
//  Webservice.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 03/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import Foundation


struct Resource<T> {
    let url:URL
    let parse: (Data)->T?
}

final class Webservice{
    
    func load<T>(resources:Resource<T>,completion:@escaping (T?)->()){
        
        URLSession.shared.dataTask(with: resources.url) { (data, response, error) in
            if let data = data{
                DispatchQueue.main.async {
                    completion(resources.parse(data))
                }
            }else{
                completion(nil)
            }
        }.resume()
    }
}
