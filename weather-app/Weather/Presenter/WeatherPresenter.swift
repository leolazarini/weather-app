//
//  WeatherPresenter.swift
//  weather-app
//
//  Created by Leonardo Filipe Lazarini on 13/11/22.
//

import UIKit

protocol WeatherPresenterProtocol {
    func getWeather(city: String)
}

final class WeatherPresenter: WeatherPresenterProtocol {
    
    private let service: WeatherServiceProtocol
    var viewController: WeatherViewControllerProtocol?
    
    init(service: WeatherServiceProtocol) {
        self.service = service
    }
    
    func getWeather(city: String) {
        self.service.fetchWeater(city: city){ [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let weatherModel):
                self.viewController?.setWeather(weatherModel: weatherModel)
            case .failure(let error):
                self.viewController?.presentAlert(message: error.localizedDescription)
            }
        }
    }
    
}
