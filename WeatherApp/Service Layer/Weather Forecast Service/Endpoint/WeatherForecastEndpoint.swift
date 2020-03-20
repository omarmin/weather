//
//  WeatherForecastEndpoint.swift
//  WeatherApp
//
//  Created by Omar on 20.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import Foundation

enum WeatherForecastEndpoint: Endpoint {
    case week
    
    var path: String {
        switch self {
        case .week:
            return "forecast"
        }
    }
}
