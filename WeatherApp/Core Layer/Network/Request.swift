//
//  Request.swift
//  WeatherApp
//
//  Created by Omar on 18.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import Foundation

protocol IRequest {
    var urlRequest: URLRequest? { get }
}

typealias Parameters = [String: String]

struct Request: IRequest {
    var endpoint: Endpoint
    var method: HTTPMethod
    var parameters: Parameters?
    var body: Encodable?
    
    init(
        _ endpoint: Endpoint,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        body: Encodable? = nil
    ) {
        self.endpoint = endpoint
        self.method = method
        self.parameters = parameters
        self.body = body
    }
    
    var urlRequest: URLRequest? {
        var urlComponents = URLComponents(url: endpoint.fullUrl, resolvingAgainstBaseURL: false)
        
        if let parameters = parameters {
            let queryItems = parameters.map { URLQueryItem(name: $0, value: $1) }
            urlComponents?.queryItems = queryItems
        }
        
        guard let url = urlComponents?.url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = body?.jsonData
        
        return urlRequest
    }
}
