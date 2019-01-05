//
//  WeatherListTableViewController.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 03/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController,SettingsDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    
    var dataSorce:WeatherDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSorce = WeatherDataSource(weatherListViewModel: weatherListViewModel)
        self.tableView.dataSource = self.dataSorce

        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToAddWeather"{
            self.prepareSegueForAddCityWeather(segue: segue)
        }else if segue.identifier == "ToSettingsTableViewController"{
            self.prepareSegueForSettings(segue: segue)
        }else if segue.identifier == "ToWeatherDetailsViewController"{
            self.prepareSegueWeatherDetail(segue: segue)
        }
    }
    
    func prepareSegueForSettings(segue: UIStoryboardSegue){
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("gone case")
        }
        guard let addWeatherNavVc = nav.viewControllers.first as? SettingsTableViewController else{
            fatalError("gone case")
        }
        addWeatherNavVc.delegate = self
    }
    
    func prepareSegueWeatherDetail(segue: UIStoryboardSegue){
        
        guard let nav = segue.destination as? WeatherDetailsViewController, let indexpath = self.tableView.indexPathForSelectedRow else {
            return
        }
        let weatherVm = self.weatherListViewModel.modelAt(index: indexpath.row)
        nav.weatherViewModel = weatherVm
        
    }
    
    func settingsDone(vm: SettingsViewModel) {
       weatherListViewModel.updateUnit(to: vm.selectedUnit)
        tableView.reloadData()
    }
    
    func prepareSegueForAddCityWeather(segue: UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("gone case")
        }
        guard let addWeatherNavVc = nav.viewControllers.first as? AddCityWeatherViewController else{
            fatalError("gone case")
        }
        addWeatherNavVc.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension WeatherListTableViewController:AddWeathreDelegateProtocol{
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm: vm)
        self.tableView.reloadData()
    }
}
