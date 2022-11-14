//
//  WeatherData.swift
//  weather-app
//
//  Created by Leonardo Filipe Lazarini on 13/11/22.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Decodable {
    let id: Int
    let description: String
}
