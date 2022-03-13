//
//  ApiCLient.swift
//  Weather Lookup
//
//  Created by Rahul Singh on 13/03/22.
//

import Foundation
import Alamofire
import UIKit


class ApiClient: SessionManager {
    static let shared = ApiClient(configuration: ApiClient.urlSessionConfiguration(), serverTrustPolicyManager: nil)
    static func urlSessionConfiguration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.httpCookieStorage = nil
        configuration.httpCookieAcceptPolicy = .never
        configuration.httpShouldSetCookies = false
        return configuration
    }
    
    static var apiDomain = "https://api.openweathermap.org/data/2.5/forecast"
    static var weatherApiKey = "65d00499677e59496ca2f318eb68c049"

    
    func request<T: Codable>(method: Alamofire.HTTPMethod = .get, path: String, parameters: RequestParameters? = nil, encoding: ParameterEncoding = URLEncoding(), additionalHeaders: [String: String] = [:], handler: RequestCompletion<T>) {
        
        // Send request
        let endpointURI = ApiClient.apiDomain + path
        
        let request = super.request(endpointURI, method: method, parameters: parameters?.parameters(), encoding: encoding, headers: ApiHeaders.contentType())
        
        // Data response
        request.responseData(completionHandler: { (response) -> Void in
            switch response.result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                guard let responseObject = try? decoder.decode(T.self, from: data) else {
                    return handler.failure!(NSError.errorWithMessage(""))
                }
                switch handler {
                case .regular(let completion): completion.success(responseObject)
                }
            case .failure:
                handler.failure?(NSError.errorWithMessage(""))
            }
        })
        debugPrint(request)
    }
}

protocol RequestParameters {
    func parameters() -> [String : Any]
}

struct ApiHeaders {
    static let defaultHeaders: [String: String] = ["Accept": "application/json"]
    static func contentType() -> [String: String] {
        return ["Content-Type": "application/json"]
    }
}
