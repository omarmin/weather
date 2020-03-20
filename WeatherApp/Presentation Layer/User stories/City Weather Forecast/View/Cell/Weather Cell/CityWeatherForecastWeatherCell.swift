//
//  CityWeatherForecastInfoCell.swift
//  WeatherApp
//
//  Created by Omar on 20.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import UIKit
import Kingfisher

class CityWeatherForecastWeatherCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    
    func setup(with model: CityWeatherForecastCellModel) {
        guard let model = model as? CityWeatherForecastWeatherCellModel else { return }
        
        dateLabel.text = model.dateString
        maxTemperatureLabel.text = model.maxTemperature
        minTemperatureLabel.text = model.minTemperature
        
        if let iconUrl = URL(string: model.iconUrlString) {
            weatherImageView.kf.setImage(with: iconUrl)
        }
    }
}
