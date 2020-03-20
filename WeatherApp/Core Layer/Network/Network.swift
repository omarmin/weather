//
//  Network.swift
//  WeatherApp
//
//  Created by Omar on 18.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import Foundation

protocol INetwork {
    func perform<T>(
        _ request: IRequest,
        completion: @escaping (Result<T, Error>) -> Void
    ) where T: Decodable
}

class Network: INetwork {
    let urlSession = URLSession(configuration: .default)
    
    func perform<T>(
        _ request: IRequest,
        completion: @escaping (Result<T, Error>) -> Void
    ) where T: Decodable {
        guard let urlRequest = request.urlRequest else { return }
        
        let onMainCompletion = { (result: Result<T, Error>) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        
        let task = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                onMainCompletion(Result.failure(error))
                return
            }
            
            guard let data = data else {
                onMainCompletion(Result.failure(NetworkError.noData))
                return
            }
            
            if (response as? HTTPURLResponse)?.statusCode != 200 {
                onMainCompletion(Result.failure(NetworkError.unknown))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                
                let model = try decoder.decode(T.self, from: data)
                onMainCompletion(Result.success(model))
            } catch {
                onMainCompletion(Result.failure(error))
            }
        }
        
        task.resume()
    }
}
