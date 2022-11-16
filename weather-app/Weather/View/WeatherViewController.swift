//
//  ViewController.swift
//  weather-app
//
//  Created by Leonardo Filipe Lazarini on 13/11/22.
//

import UIKit

protocol WeatherViewControllerProtocol{
    func setWeather(weatherModel: WeatherModel)
    func presentAlert(message: String)
}

class WeatherViewController: UIViewController, WeatherViewControllerProtocol {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    
    private var presenter: WeatherPresenterProtocol
    
    init(presenter: WeatherPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getWeather(city: "Joinville")
    }
    
    private func getWeather(city: String){
        createSpinnerView()
        self.presenter.getWeather(city: city)
    }
    
    func setWeather(weatherModel: WeatherModel){
        self.cityNameLabel.text = weatherModel.cityName
        self.conditionImage.image = UIImage(systemName: weatherModel.conditionImage)
        self.temperatureLabel.text = weatherModel.temperatureToString
        self.descriptionLabel.text = weatherModel.description.capitalized
        self.lowTemperatureLabel.text = weatherModel.lowestTemperatureToString
        self.highTemperatureLabel.text = weatherModel.highestTemperatureToString
    }
}



