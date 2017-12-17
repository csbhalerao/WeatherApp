//
//  CityWeatherViewController.swift
//  WeatherApp
//
//  Created by Chetan Bhalerao on 12/17/17.
//  Copyright © 2017 Chetan Bhalerao. All rights reserved.
//

import UIKit
class CityWeatherViewController: UIViewController {
    
    @IBOutlet weak var cityNameText: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var humidityText: UILabel!
    @IBOutlet weak var tempratureText: UILabel!
    
    
    var city: CityModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateCityDetails()
        getWeatherInfo()
    }
    
    func populateCityDetails(){
        cityNameText.text = city?.name
        cityImage.image = city?.cityImage
    }
    
    func getWeatherInfo()  {
        
    }
}
