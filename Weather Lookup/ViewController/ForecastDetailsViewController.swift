//
//  ForecastDetailsViewController.swift
//  Weather Lookup
//
//  Created by Rahul Singh on 13/03/22.
//

import UIKit

class ForecastDetailsViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var tempFeelsLikeLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    var weatherDetails: WeatherList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let details = weatherDetails {
            self.temperatureLabel.text = "\(details.main.temp)"
            self.tempFeelsLikeLabel.text = "\(details.main.feelsLike)"
            self.weatherLabel.text = details.weather.first?.main ?? ""
            self.weatherDescriptionLabel.text = details.weather.first?.description ?? ""
        }
    }
    
}
