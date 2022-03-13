//
//  ForecastCell.swift
//  Weather Lookup
//
//  Created by Rahul Singh on 13/03/22.
//

import UIKit

class ForecastCell: UITableViewCell {

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ list: WeatherList) {
        if let weather = list.weather.first {
            self.weatherLabel.text = weather.main
            self.temperatureLabel.text = "Temp: " + String(list.main.temp)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
