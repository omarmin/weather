import Foundation

class CityWeatherForecastInteractor {
    weak var output: CityWeatherForecastInteractorOutput!
    var weatherForecastService: IWeatherForecastService!
}

// MARK: - CityWeatherForecastInteractorInput
extension CityWeatherForecastInteractor: CityWeatherForecastInteractorInput {
    func getForecast(for city: String) {
        weatherForecastService.getWeekWeatherForecast(for: city) { [weak self] result in
            switch result {
            case .success(let forecast):
                self?.output.didLoadForecastSuccessfully(forecast)
            case .failure(let error):
                self?.output.didFailedLoadingForecast(error)
            }
        }
    }
}
