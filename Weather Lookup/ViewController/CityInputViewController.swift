//
//  CityInputViewController.swift
//  Weather Lookup
//
//  Created by Rahul Singh on 13/03/22.
//

import UIKit

class CityInputViewController: UIViewController {

    @IBOutlet weak var cityNameTextfield: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func lookupAction(_ sender: UIButton) {
        activityIndicator.startAnimating()
        ApiClient.shared.getCityWeatherDetails(of: cityNameTextfield.text!, handler: RegularRequestCompletion<Weather>(success: { response in
            print(response)
            self.activityIndicator.stopAnimating()
            if (response.cod == "200") {
                self.performSegue(withIdentifier: "segue_forecast", sender: response.list)
            } else {
                self.showAlert(response.message ?? "Something went wrong")
            }
        }, failure: { error in
            self.activityIndicator.stopAnimating()
            self.showAlert(error.localizedDescription)
        }))
        
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CityWeatherForecastViewController {
            destination.weatherDetails = sender as? [WeatherList]
        }
    }

}
