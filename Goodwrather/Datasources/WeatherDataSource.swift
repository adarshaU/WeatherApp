//
//  WeatherDataSource.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 05/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import Foundation
import UIKit


class WeatherDataSource:NSObject,UITableViewDataSource{
    
    private let cellIdentifier = "WeatherTableViewCell"
    private let weatherListViewModel:WeatherListViewModel
    
   
    init(weatherListViewModel:WeatherListViewModel) {
        self.weatherListViewModel = weatherListViewModel
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherListViewModel.numberOfRows(section)
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! WeatherTableViewCell
        let weatherModel = self.weatherListViewModel.modelAt(index: indexPath.row)
        cell.configure(weatherModel)
        return cell
    }
    
}
