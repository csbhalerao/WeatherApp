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
        cityNameText.text = cityModel.name.capitalized
    }
    
    func setCityImage(cityImage: UIImage) {
        if(cityImage != nil){
            cityImageView.image = cityImage
        }
    }
}
