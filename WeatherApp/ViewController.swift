//
//  ViewController.swift
//  WeatherApp
//
//  Created by Chetan Bhalerao on 10/17/17.
//  Copyright © 2017 Chetan Bhalerao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var editLatitude: UITextField!
    
    @IBOutlet weak var editLongitude: UITextField!
    
    @IBOutlet weak var textTemp: UILabel!
    
    @IBOutlet weak var textLocation: UILabel!
    
    @IBOutlet weak var textHumidity: UILabel!
    
    @IBOutlet weak var progressBar: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.isHidden = true
    }
    
    @IBAction func getWeatherInfo(_ sender: Any) {
        let latitude = self.editLatitude.text
        let longitude = self.editLongitude.text
        if latitude == "" || longitude == "" {
            let alert = UIAlertController(title: "Error", message: "Latitude or longitude is missing", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            return
        }
        DispatchQueue.main.async(execute: {
        self.progressBar.isHidden = false
        self.progressBar.startAnimating()
        })
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=" + latitude! + "&lon=" + longitude! + "&APPID=d61384f0132bf883329306f506486aee&units=metric") else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options:.mutableContainers)
                    print(json)
                    guard let weatherInfo = json as? [String:Any] else {
                        print("no weatherinfo")
                        return }
                    guard let mainDict = weatherInfo["main"] as? [String:Any] else {
                        print("no main")
                        return }
                    guard let humidity = mainDict["humidity"] as? Int else{
                        print("no humidity")
                        return
                    }
                    guard let temp = mainDict["temp"] as? Any else {
                        print("no temp")
                        return
                    }
                    guard let locationName = weatherInfo["name"] as? String else {
                        print("no location name")
                        return}
                    DispatchQueue.main.async(execute: {
                        self.progressBar.stopAnimating()
                        self.progressBar.isHidden = true
                        self.textLocation.text = "Location Name: " + locationName
                        if let temp:String = String(describing: temp) {
                                self.textTemp.text = "Temprature: " + temp
                        }
                        
                        self.textHumidity.text = "Humidity: " + String(humidity)}
                    )
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    
    
}

