//
//  CityWeatherForecastDataConverterInput.swift
//  WeatherApp
//
//  Created by Omar on 20.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import Foundation

protocol CityWeatherForecastDataConverterInput {
    func convertModels(from: Forecast) -> [CityWeatherForecastCellModel]
}
