//
//  WeatherModel.swift
//  weather-app
//
//  Created by Leonardo Filipe Lazarini on 13/11/22.
//

import Foundation

struct WeatherModel {
    
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let description: String
    let lowestTemperature: Double
    let highestTemperature: Double
    
    var temperatureToString: String {
        String(format: "%.1fº", temperature)
    }
    
    var lowestTemperatureToString: String {
        String(format: "%.1fº", lowestTemperature)
    }
    
    var highestTemperatureToString: String {
        String(format: "%.1fº", highestTemperature)
    }
    
    var conditionImage: String {
        switch conditionId {
            case 200...232:
                return "cloud.bolt"
            case 300...321:
                return "cloud.drizzle"
            case 500...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 701...781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud"
            default:
                return "cloud"
        }
    }
}
