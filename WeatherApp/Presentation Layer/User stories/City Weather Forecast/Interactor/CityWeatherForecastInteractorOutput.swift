import Foundation

protocol CityWeatherForecastInteractorOutput: class {
    func didLoadForecastSuccessfully(_ forecast: Forecast)
    func didFailedLoadingForecast(_ error: Error)
}
