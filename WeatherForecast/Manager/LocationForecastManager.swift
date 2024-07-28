//
//  LocationForecastManager.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation
import Combine

class LocationForecastManager {
    static let shared = LocationForecastManager()
    
    private let apiManager = APIManager.shared
    
    private init() {}
    
    func fetchLocationForecast(latitude: String, longitude: String) -> AnyPublisher<(LocationForecast), Error> {
        return apiManager.fetchData(UserRouter.locationForecast(latitude, longitude))
    }
}
