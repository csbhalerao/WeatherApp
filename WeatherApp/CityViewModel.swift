//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Chetan Bhalerao on 1/21/18.
//  Copyright © 2018 Chetan Bhalerao. All rights reserved.
//

import Foundation
import UIKit

class CityViewModel {
    var name: String
    var latitude: Double
    var longitude: Double
    var cityUrl: String
    var cityImage: UIImage
    
    init(name: String, latitude: Double, longitude: Double, cityUrl: String, cityImage: UIImage) {
        self.name = name;
        self.latitude = latitude
        self.longitude = longitude
        self.cityUrl = cityUrl
        self.cityImage = cityImage
    }
    
    
}
