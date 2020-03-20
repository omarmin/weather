import UIKit

final class CityWeatherForecastViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    // MARK: Properties
    
    var output: CityWeatherForecastViewOutput!
    var displayManager: CityWeatherForecastDisplayManagerInput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.didTriggerViewReadyEvent()
    }
}

// MARK: - CityWeatherForecastViewInput
extension CityWeatherForecastViewController: CityWeatherForecastViewInput {
    func setupInitialState() {
        displayManager.configure(tableView)
        cityTextField.delegate = self
    }
    
    func showActivityIndicator() {
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    func clearData() {
        displayManager.clearData()
    }
    
    func show(_ forecast: Forecast) {
        displayManager.show(forecast)
    }
    
    func showErrorLabel(text: String) {
        errorLabel.text = text
        errorLabel.isHidden = false
    }
    
    func hideErrorLabel() {
        errorLabel.isHidden = true
    }
}

// MARK: - UITextFieldDelegate
extension CityWeatherForecastViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let city = textField.text {
            output.didEnter(city: city)
        }
        
        return true
    }
}
