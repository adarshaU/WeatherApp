//
//  AddCityWeatherViewController.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 03/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import UIKit


protocol AddWeathreDelegateProtocol {
    func addWeatherDidSave(vm:WeatherViewModel)
}


class AddCityWeatherViewController: UIViewController {

    private var addCityViewModel = AddCityViewModel()
    
    @IBOutlet weak var cityNameTextField: BindingUITextField!{
        didSet{
            cityNameTextField.bind { (valueRecived) in
                self.addCityViewModel.city = valueRecived
            }
        }
    }
    
    @IBOutlet weak var stateTextField: BindingUITextField!{
        didSet{
            stateTextField.bind {self.addCityViewModel.state = $0}
        }
    }
    
    @IBOutlet weak var zipCodeTextField: BindingUITextField!{
        didSet{
            zipCodeTextField.bind{self.addCityViewModel.zipcode = $0}
        }
    }
    
    
    var delegate:AddWeathreDelegateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveAction(_ sender: UIButton) {
        
        print(self.addCityViewModel)
        
        if let city = cityNameTextField.text, let formattedCity = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            
            let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(formattedCity)&appid=2e03e8ae7fac863d9622ee2d2ca6937d&units=imperial")!
            
            //Parsing Section and return back to weservice once parse done
            
            let weatherResoruces = Resource<WeatherViewModel>(url:url){ data in
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            
            Webservice().load(resources: weatherResoruces) { [weak self] (result) in
                if let weatherVM = result {
                    if let delegate = self?.delegate{
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
}
