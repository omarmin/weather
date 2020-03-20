//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Omar on 18.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import Foundation

protocol Endpoint {
    static var baseUrl: URL { get }
    var path: String { get }
    var fullUrl: URL { get }
}

extension Endpoint {
    var fullUrl: URL {
        return Self.baseUrl.appendingPathComponent(path)
    }
}
