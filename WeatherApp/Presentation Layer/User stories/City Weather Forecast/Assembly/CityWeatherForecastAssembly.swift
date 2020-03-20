import UIKit

class CityWeatherForecastAssembly {
    static func assemble() -> UIViewController {
        let view = UIStoryboard(name: "CityWeatherForecast", bundle: nil).instantiateInitialViewController() as! CityWeatherForecastViewController
        let presenter = CityWeatherForecastPresenter()
        let interactor = CityWeatherForecastInteractor()
        let router = CityWeatherForecastRouter()
        let displayManager = CityWeatherForecastDisplayManager()
        let dataConverter = CityWeatherForecastDataConverter()
        
        view.output = presenter
        view.displayManager = displayManager
        
        displayManager.dataConverter = dataConverter
        
        interactor.output = presenter
        interactor.weatherForecastService = WeatherForecastService()
        
        router.transitionHandler = view

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
