//
//  CityWeatherForecastCellModel.swift
//  WeatherApp
//
//  Created by Omar on 20.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import Foundation

enum CityWeatherForecastCellType {
    case weather
}

protocol CityWeatherForecastCellModel {
    var type: CityWeatherForecastCellType { get }
}
