//
//  CityWeatherForecastDataConverter.swift
//  WeatherApp
//
//  Created by Omar on 20.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import UIKit

class CityWeatherForecastDataConverter {
    func iconUrlString(from iconName: String?) -> String {
        guard let iconName = iconName else { return "" }
        return "https://openweathermap.org/img/wn/\(iconName)@2x.png"
    }
    
    func day(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
}

// MARK: - CityWeatherForecastDataConverterInput {
extension CityWeatherForecastDataConverter: CityWeatherForecastDataConverterInput {
    func convertModels(from forecast: Forecast) -> [CityWeatherForecastCellModel] {
        var models: [CityWeatherForecastCellModel] = []
        
        for dayForecast in forecast.list {
            let model = CityWeatherForecastWeatherCellModel(
                dateString: day(from: dayForecast.date),
                iconUrlString: iconUrlString(from: dayForecast.weather.first?.icon),
                maxTemperature: "\(Int(dayForecast.main.maxTemperature + 0.5))",
                minTemperature: "\(Int(dayForecast.main.minTemperature + 0.5))"
            )
            models.append(model)
        }
        
        return models
    }
}
