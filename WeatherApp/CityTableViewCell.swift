//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Chetan Bhalerao on 12/3/17.
//  Copyright © 2017 Chetan Bhalerao. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameText: UILabel!
    
    func setCityDetails(cityModel: CityModel){
        cityImageView.image = cityModel.cityImage
        cityNameText.text = cityModel.name.capitalized
    }
}
