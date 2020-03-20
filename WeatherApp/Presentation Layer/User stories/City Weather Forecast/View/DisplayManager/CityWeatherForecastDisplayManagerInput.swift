//
//  CityWeatherForecastDisplayManagerInput.swift
//  WeatherApp
//
//  Created by Omar on 20.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import UIKit

protocol CityWeatherForecastDisplayManagerInput: class {
    func configure(_ tableView: UITableView)
    func clearData()
    func show(_ forecast: Forecast)
}
