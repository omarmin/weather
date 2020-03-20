//
//  Forecast.swift
//  WeatherApp
//
//  Created by Omar on 20.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import Foundation

struct Forecast: Decodable {
    let list: [DayForecast]
}

struct DayForecast: Decodable {
    let date: Date
    let main: Main
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case main = "main"
        case weather = "weather"
    }
}

struct Main: Decodable {
    let temperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
    }
}

struct Weather: Decodable {
    let main: String
    let description: String
    let icon: String
}
