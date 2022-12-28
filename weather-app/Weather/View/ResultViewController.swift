//
//  ViewController.swift
//  weather-app
//
//  Created by Leonardo Filipe Lazarini on 28/12/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    
    var weatherModel: WeatherModel!
    
//    init(weatherModel: WeatherModel) {
//        self.weatherModel = weatherModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWeather()
    }
    
    private func setWeather() {
        self.cityNameLabel.text = weatherModel.cityName
        self.conditionImage.image = UIImage(systemName: weatherModel.conditionImage)
        self.temperatureLabel.text = weatherModel.temperatureToString
        self.descriptionLabel.text = weatherModel.description.capitalized
        self.lowTemperatureLabel.text = weatherModel.lowestTemperatureToString
        self.highTemperatureLabel.text = weatherModel.highestTemperatureToString
    }
    
}



