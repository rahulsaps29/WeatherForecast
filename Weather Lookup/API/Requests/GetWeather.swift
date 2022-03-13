//
//  GetWeather.swift
//  Weather Lookup
//
//  Created by Rahul Singh on 13/03/22.
//

import Foundation

extension ApiClient {
    
    func getCityWeatherDetails(of city: String, handler: RegularRequestCompletion<Weather>) {
        let params = CityDetail(cityName: city)
        request(method: .get, path: "", parameters: params, handler: RequestCompletion.regular(completion: handler))
    }
}

struct CityDetail: RequestParameters {
    let cityName: String
    
    func parameters() -> [String : Any] {
        return [
            "q": cityName,
            "appid": ApiClient.weatherApiKey
        ]
    }
}
