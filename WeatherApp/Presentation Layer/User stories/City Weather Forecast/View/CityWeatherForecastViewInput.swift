import Foundation

protocol CityWeatherForecastViewInput: class {
    func setupInitialState()
    func showActivityIndicator()
    func hideActivityIndicator()
    func clearData()
    
    func show(_ forecast: Forecast)
    func showErrorLabel(text: String)
    func hideErrorLabel()
}
