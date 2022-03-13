//
//  WeatherDetails.swift
//  Weather Lookup
//
//  Created by Rahul Singh on 13/03/22.
//

import Foundation

typealias WeatherList = Weather.List


struct Weather: Codable {
    var cod: String
    var message: String?
    var list: [List]?
    
    struct List: Codable {
        let main: Main
        let weather: [Details]
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cod = try container.decode(String.self, forKey: .cod)
        do {
            list = try container.decode(Array.self, forKey: .list)
        } catch DecodingError.keyNotFound {
            list = []
        }
        do {
            message = try String(container.decode(Int.self, forKey: .message))
        } catch DecodingError.typeMismatch {
            message = try container.decode(String.self, forKey: .message)
        }
    }
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}

struct Details: Codable {
    let main: String
    let description: String
}
