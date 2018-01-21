//
//  CityListViewController.swift
//  WeatherApp
//
//  Created by Chetan Bhalerao on 12/2/17.
//  Copyright © 2017 Chetan Bhalerao. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Alamofire

class CityListViewController: UIViewController {
    
    @IBOutlet weak var cityTableView: UITableView!
    var cityModels:[CityModel] = []
    var cityViewModels:[CityViewModel] = []
    var ref: DatabaseReference!
    var CITIES_KEY = "cities"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.dataSource = self
        cityTableView.delegate = self
        populateCityValues()
    }
    
    func populateCityValues()  {
        ref = Database.database().reference()
        ref.child(CITIES_KEY).observe(.value, with:{ snapshot in
            //print(snapshot.childrenCount)
            print(snapshot)
            if snapshot.childrenCount > 0 {
                self.cityModels.removeAll()
                self.cityViewModels.removeAll()
                for cities in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let citiesObject = cities.value as? [String: AnyObject]
                    let cityName  = citiesObject?["name"]
                    let latitude  = citiesObject?["latitude"]
                    let longitude = citiesObject?["longitude"]
                    let imageUrl = citiesObject?["imageUrl"]
                    let city = CityModel(name:cityName as! String, latitude:latitude as! Double, longitude:longitude as! Double, cityUrl:imageUrl as! String)
                    self.cityModels.append(city)
                }
                self.cityTableView.reloadData()
            }
            
        })
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
        Alamofire.request(cityModel.cityUrl).responseData { (response) in
            if response.error == nil {
                if let data = response.data {
                    cell.setCityImage(cityImage: UIImage(data: data)!)
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let cell = self.cityTableView.cellForRow(at: indexPath) as! CityTableViewCell
        
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "CityWeatherViewController") as! CityWeatherViewController
        detailViewController.city = cityModels[indexPath.row]
        detailViewController.cityUIImage = cell.cityImageView.image!
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
