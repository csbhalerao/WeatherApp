//
//  CityWeatherViewController.swift
//  WeatherApp
//
//  Created by Chetan Bhalerao on 12/17/17.
//  Copyright © 2017 Chetan Bhalerao. All rights reserved.
//

import UIKit
import Alamofire
import GoogleMaps
class CityWeatherViewController: UIViewController {
    
    @IBOutlet weak var cityNameText: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var humidityText: UILabel!
    @IBOutlet weak var tempratureText: UILabel!
    
    @IBOutlet weak var mapView: GMSMapView!
    
    
    var city: CityModel?
    var cityUIImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateCityDetails()
        getWeatherInfo()
    }
    
    func populateCityDetails(){
        cityNameText.text = city?.name
        populateCityImage()
        drawMapContent()
    }
    
    func drawMapContent(){
        let camera = GMSCameraPosition.camera(withLatitude: city?.latitude ?? 0.0, longitude: city?.longitude ?? 0.0, zoom: 12.0)
        mapView.camera = camera
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: city?.latitude ?? 0.0, longitude: city?.longitude ?? 0.0)
        marker.title = city?.name
        marker.snippet = city?.name
        marker.map = mapView
    }
    
    func populateCityImage(){
        if self.cityUIImage != nil{
            cityImage.image = self.cityUIImage
        } else {
            if let cityUrl = city?.cityUrl{
                Alamofire.request(cityUrl).responseData { (response) in
                    if response.error == nil {
                        if let data = response.data {
                            self.cityImage.image = UIImage(data: data)!
                        }
                    }
                }
            }
        }
    }
    
    func getWeatherInfo()  {
        let API_URL = "https://api.openweathermap.org/data/2.5/weather"
        let APP_ID = "d61384f0132bf883329306f506486aee"
        
        var parameters: [String: AnyObject] = ["lat": city?.latitude as AnyObject, "lon": city?.longitude as AnyObject, "APPID": APP_ID as AnyObject, "units": "metric" as AnyObject]
        
        Alamofire.request(API_URL, method: .get, parameters: parameters).responseString{
            response in
            switch (response.result){
            case .success(let responseString):
                //   print(responseString)
                let cityResponse = CityWeatherDetailResponse(JSONString: "\(responseString)")
                if let cityWeather = cityResponse?.cityWeather{
                    if let temp = cityWeather.temp {
                        self.tempratureText.text = "Temp : " + String(temp)
                    }
                    if let humidity = cityWeather.humidity {
                        self.humidityText.text = "Humidity : " + String(humidity)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        
        
    }
}
