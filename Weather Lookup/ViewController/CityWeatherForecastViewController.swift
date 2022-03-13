//
//  CityWeatherForecastViewController.swift
//  Weather Lookup
//
//  Created by Rahul Singh on 13/03/22.
//

import UIKit

class CityWeatherForecastViewController: UIViewController {

    @IBOutlet weak var forecastTableView: UITableView!
    var weatherDetails: [WeatherList]?

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ForecastDetailsViewController {
            destination.weatherDetails = sender as? WeatherList
        }
    }
}

extension CityWeatherForecastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let details = weatherDetails {
            return details.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell") as! ForecastCell
        cell.configureCell(self.weatherDetails![indexPath.row])
        return cell
    }
}

extension CityWeatherForecastViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let details = self.weatherDetails {
            let selectedWeather = details[indexPath.row]
            self.performSegue(withIdentifier: "segue_details", sender: selectedWeather)
        }
    }
}
