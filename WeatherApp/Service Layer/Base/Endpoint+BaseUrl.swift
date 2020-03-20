//
//  Endpoint+BaseUrl.swift
//  WeatherApp
//
//  Created by Omar on 20.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import Foundation

extension Endpoint {
    static var baseUrl: URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/")!
    }
}
