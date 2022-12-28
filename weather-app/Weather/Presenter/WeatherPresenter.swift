//
//  WeatherPresenter.swift
//  weather-app
//
//  Created by Leonardo Filipe Lazarini on 13/11/22.
//

import UIKit

protocol WeatherPresenterProtocol {
    var viewController: WeatherViewControllerProtocol? { get set }
    func getWeather(city: String)
}

protocol WeatherCoordinatorProtocol {
    func navigateToResult(weatherModel: WeatherModel)
}

final class WeatherPresenter: WeatherPresenterProtocol {
    
    private let service: WeatherServiceProtocol
    var viewController: WeatherViewControllerProtocol?
    var coordinator: WeatherCoordinatorProtocol
    
    init(coordinator: WeatherCoordinatorProtocol, service: WeatherServiceProtocol) {
        self.coordinator = coordinator
        self.service = service
    }
    
    func getWeather(city: String) {
        self.service.fetchWeater(city: city){ [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let weatherModel):
                self.coordinator.navigateToResult(weatherModel: weatherModel)
            case .failure(let error):
                self.viewController?.presentAlert(message: error.localizedDescription)
            }
        }
    }
    
}
