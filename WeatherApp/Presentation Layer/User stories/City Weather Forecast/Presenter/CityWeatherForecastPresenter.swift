import Foundation

class CityWeatherForecastPresenter {

    // MARK: Properties
    weak var view: CityWeatherForecastViewInput!
    var interactor: CityWeatherForecastInteractorInput!
    var router: CityWeatherForecastRouterInput!
}

// MARK: - CityWeatherForecastViewOutput
extension CityWeatherForecastPresenter: CityWeatherForecastViewOutput {
    func didTriggerViewReadyEvent() {
        view.setupInitialState()
    }
    
    func didEnter(city: String) {
        view.clearData()
        view.hideErrorLabel()
        view.showActivityIndicator()
        interactor.getForecast(for: city)
    }
}

// MARK: - CityWeatherForecastInteractorOutput
extension CityWeatherForecastPresenter: CityWeatherForecastInteractorOutput {
    func didLoadForecastSuccessfully(_ forecast: Forecast) {
        view.hideActivityIndicator()
        view.show(forecast)
    }
    
    func didFailedLoadingForecast(_ error: Error) {
        view.hideActivityIndicator()
        view.showErrorLabel(text: "City not found")
    }
}
