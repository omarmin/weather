//
//  CityWeatherForecastInfoCellModel.swift
//  WeatherApp
//
//  Created by Omar on 20.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import Foundation

struct CityWeatherForecastWeatherCellModel: CityWeatherForecastCellModel {
    let type: CityWeatherForecastCellType = .weather
    let dateString: String
    let iconUrlString: String
    let maxTemperature: String
    let minTemperature: String
}
