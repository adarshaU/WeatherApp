//
//  WeatherListTableViewController.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 03/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController {

    
    private var weatherListViewModel = WeatherListViewModel(){
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherListViewModel.numberOfRows(section)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("gone case")
        }
        guard let addWeatherNavVc = nav.viewControllers.first as? AddCityWeatherViewController else{
            fatalError("gone case")
        }
        
        addWeatherNavVc.delegate = self
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        
        let weatherModel = self.weatherListViewModel.modelAt(index: indexPath.row)
        cell.configure(weatherModel)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

   

}


extension WeatherListTableViewController:AddWeathreDelegateProtocol{
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm: vm)
    }
}
