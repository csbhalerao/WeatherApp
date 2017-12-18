//
//  CityWeatherDetailResponse.swift
//  WeatherApp
//
//  Created by Chetan Bhalerao on 12/17/17.
//  Copyright © 2017 Chetan Bhalerao. All rights reserved.
//

import Foundation
import ObjectMapper

class CityWeatherDetailResponse:Mappable {
    var cityWeather: CityWeatherDetail?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        cityWeather <- map["main"]
    }
}

class CityWeatherDetail:Mappable{
    var temp: Double?
    var humidity: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        temp <- map["temp"]
        humidity <- map["humidity"]
    }
}
