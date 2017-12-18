//
//  CityWeatherViewController.swift
//  WeatherApp
//
//  Created by Chetan Bhalerao on 12/17/17.
//  Copyright © 2017 Chetan Bhalerao. All rights reserved.
//

import UIKit
import Alamofire
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
        let API_URL = "https://api.openweathermap.org/data/2.5/weather"
        let APP_ID = "d61384f0132bf883329306f506486aee"
        
        var parameters: [String: AnyObject] = ["lat": city?.latitude as AnyObject, "lon": city?.longitude as AnyObject, "APPID": APP_ID as AnyObject, "units": "metric" as AnyObject]
        
        Alamofire.request(API_URL, method: .get, parameters: parameters).responseData(completionHandler: <#T##(DataResponse<Data>) -> Void#>)
    }
}
