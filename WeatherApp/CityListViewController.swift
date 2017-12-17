//
//  CityListViewController.swift
//  WeatherApp
//
//  Created by Chetan Bhalerao on 12/2/17.
//  Copyright © 2017 Chetan Bhalerao. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController {

    @IBOutlet weak var cityTableView: UITableView!
    var cityModels:[CityModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.dataSource = self
        cityTableView.delegate = self
        cityModels = populateCityValues()
    }
    
    func populateCityValues() -> [CityModel] {
        var tempCities:[CityModel] = []
        let puneCity = CityModel(name:"Pune", latitude: 18.52041212, longitude: 73.8567323, cityImage: #imageLiteral(resourceName: "pune"))
        let mumbaiCity = CityModel(name:"Mumbai", latitude: 19.0728300, longitude: 72.8826100, cityImage:#imageLiteral(resourceName: "mumbai"))
        let bangaloreCity = CityModel(name:"Bangalore", latitude: 12.9715987, longitude: 77.5945627, cityImage:#imageLiteral(resourceName: "bangalore"))
        let delhiCity = CityModel(name:"Delhi", latitude: 28.644800, longitude: 77.216721, cityImage:#imageLiteral(resourceName: "delhi"))
        
        tempCities.append(puneCity)
        tempCities.append(mumbaiCity)
        tempCities.append(bangaloreCity)
        tempCities.append(delhiCity)
        
        return tempCities
    }
}
    extension CityListViewController:  UITableViewDataSource, UITableViewDelegate{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cityModels.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cityModel = cityModels[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityDetail") as! CityTableViewCell
            cell.setCityDetails(cityModel: cityModel)
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let detailViewController = storyBoard.instantiateViewController(withIdentifier: "CityWeatherViewController") as! CityWeatherViewController
            detailViewController.city = cityModels[indexPath.row]
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
