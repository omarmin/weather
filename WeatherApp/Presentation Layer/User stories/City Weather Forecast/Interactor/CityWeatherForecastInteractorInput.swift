import Foundation

protocol CityWeatherForecastInteractorInput: class {
    func getForecast(for city: String)
}
