//
//  CityModel.swift
//  WeatherApp
//
//  Created by Chetan Bhalerao on 12/3/17.
//  Copyright © 2017 Chetan Bhalerao. All rights reserved.
//

import Foundation
import UIKit

class CityModel{
    var name: String
    var latitude: Double
    var longitude: Double
    var cityImage: UIImage
 
    init(name: String, latitude: Double, longitude: Double, cityImage: UIImage ) {
        self.name = name;
        self.latitude = latitude
        self.longitude = longitude
        self.cityImage = cityImage
    }
}
