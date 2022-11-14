//
//  ViewController.swift
//  weather-app
//
//  Created by Leonardo Filipe Lazarini on 13/11/22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    
    var weatherService = WeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherService.delegate = self
        
        weather("Joinville")
    }
    
    func weather(_ city: String) {
        createSpinnerView()
        weatherService.weather(city)
    }
    
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherServiceDelegate{
    
    func didUpdateWeather(_ weather: WeatherModel){
        self.cityNameLabel.text = weather.cityName
        self.conditionImage.image = UIImage(systemName: weather.conditionImage)
        self.temperatureLabel.text = weather.temperatureToString
        self.descriptionLabel.text = weather.description.capitalized
        self.lowTemperatureLabel.text = weather.lowestTemperatureToString
        self.highTemperatureLabel.text = weather.highestTemperatureToString
    }
    
    func didFailWithError(errorMessage: String) {
        self.presentAlert(message: errorMessage)
    }
}

