//
//  WeatherService.swift
//  weather-app
//
//  Created by Leonardo Filipe Lazarini on 13/11/22.
//

import Foundation

typealias WeatherCompletion = (Result<WeatherModel, NetworkError>) -> Void

enum NetworkError: Error {
    case badURL
    case serviceInternalError(_ error: Error)
    case noData
    case decodeError(_ error: Error)
}

protocol WeatherServiceProtocol {
    func fetchWeater(city: String, _ completion: @escaping WeatherCompletion)
}

final class WeatherService: WeatherServiceProtocol {
    let session: URLSession
    var baseUrl = Constants.baseUrl
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchWeater(city: String, _ completion: @escaping WeatherCompletion) {
        guard let url = URL(string: baseUrl + city) else {
            completion(.failure(.badURL))
            return
        }
        
        session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.serviceInternalError(error)))
                }
                
                if let data = data {
                    do {
                        let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                        let weatherModel = self.parseWeatherData(weatherData: weatherData)
                        completion(.success(weatherModel))
                    } catch let error {
                        completion(.failure(.decodeError(error)))
                    }
                } else {
                    completion(.failure(.noData))
                }
            }
        }.resume()
    }
    
    private func parseWeatherData(weatherData: WeatherData) -> WeatherModel {
        return WeatherModel(conditionId: weatherData.weather[0].id, cityName: weatherData.name, temperature: weatherData.main.temp, description: weatherData.weather[0].description, lowestTemperature: weatherData.main.temp_min, highestTemperature: weatherData.main.temp_max)
    }
}
