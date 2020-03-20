//
//  ForecastService.swift
//  WeatherApp
//
//  Created by Omar on 20.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import Foundation

protocol IWeatherForecastService {
    func getWeekWeatherForecast(
        for city: String,
        completion: @escaping (Result<Forecast, Error>) -> Void
    )
}

class WeatherForecastService: IWeatherForecastService {
    let network: INetwork = Network()
    
    func getWeekWeatherForecast(
        for city: String,
        completion: @escaping (Result<Forecast, Error>) -> Void
    ) {
        let parameters = [
            "appid": "b38fe723b000e34cda8ac0b83ab8120f",
            "q": "\(city)",
            "units": "metric",
            "lang": "ru"
        ]
        
        let request = Request(WeatherForecastEndpoint.week, parameters: parameters)
        
        network.perform(request) { result in
            completion(result)
        }
    }
}
