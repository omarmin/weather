//
//  CityWeatherForecastDisplayManager.swift
//  WeatherApp
//
//  Created by Omar on 20.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import UIKit

class CityWeatherForecastDisplayManager: NSObject {
    
    // MARK: Properties
    var dataConverter: CityWeatherForecastDataConverterInput!
    var tableView: UITableView!
    var models: [CityWeatherForecastCellModel] = []
    
    func registerCells() {
        let infoNib = UINib(nibName: "CityWeatherForecastWeatherCell", bundle: nil)
        tableView.register(infoNib, forCellReuseIdentifier: "CityWeatherForecastWeatherCell")
    }
}

// MARK: - CityWeatherForecastDisplayManagerInput
extension CityWeatherForecastDisplayManager: CityWeatherForecastDisplayManagerInput {
    func configure(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        registerCells()
    }
    
    func clearData() {
        models = []
        tableView.reloadData()
    }
    
    func show(_ forecast: Forecast) {
        models = dataConverter.convertModels(from: forecast)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension CityWeatherForecastDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        
        switch model.type {
        case .weather:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityWeatherForecastWeatherCell", for: indexPath) as! CityWeatherForecastWeatherCell
            cell.setup(with: model)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension CityWeatherForecastDisplayManager: UITableViewDelegate {
    
}
