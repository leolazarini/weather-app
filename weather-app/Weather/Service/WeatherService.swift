//
//  WeatherService.swift
//  weather-app
//
//  Created by Leonardo Filipe Lazarini on 13/11/22.
//

import Foundation

protocol WeatherServiceDelegate {
    func didUpdateWeather(_ weather: WeatherModel)
    func didFailWithError(errorMessage: String)
}

final class WeatherService {
    let session: URLSession
    var baseUrl = Constants.baseUrl
    
    var delegate: WeatherServiceDelegate?
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func weather(_ endpoint: String) {
        if let url = URL(string: baseUrl + endpoint) {
            
            session.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        self.delegate?.didFailWithError(errorMessage: error.localizedDescription)
                    }
                    if let data = data {
                        do {
                            let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                            let weather = WeatherModel(
                                conditionId: weatherData.weather[0].id,
                                cityName: weatherData.name,
                                temperature: weatherData.main.temp,
                                description: weatherData.weather[0].description,
                                lowestTemperature: weatherData.main.temp_min,
                                highestTemperature: weatherData.main.temp_max
                            )
                            self.delegate?.didUpdateWeather(weather)
                        } catch let error {
                            self.delegate?.didFailWithError(errorMessage: error.localizedDescription)
                        }
                    } else {
                        self.delegate?.didFailWithError(errorMessage: error!.localizedDescription)
                    }
                }
            }.resume()
        }
    }
}
