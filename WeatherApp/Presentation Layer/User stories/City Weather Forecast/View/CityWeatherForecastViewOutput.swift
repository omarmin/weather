import Foundation

protocol CityWeatherForecastViewOutput: class {
    func didTriggerViewReadyEvent()
    func didEnter(city: String)
}
