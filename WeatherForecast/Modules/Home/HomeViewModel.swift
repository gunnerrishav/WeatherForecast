//
//  HomeViewModel.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation

class HomeViewModel: BaseViewModel {
    /// holds latitude and longitude of the device
    let latitude, longitude: Double?
    
    /// holds the state and data of locationForecast
    @Published var locationForecast: LoadingState<LocationForecast> = .idle
    
    /// holds instance of locationForecast manager for API Call
    let locationForecastManager = LocationForecastManager.shared
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
        super.init()
        fetchLocationForecast()
    }
    
    /// Fetch locationForecast from API
    func fetchLocationForecast() {
        locationForecast = .loading
        locationForecastManager.fetchLocationForecast(latitude: "\(latitude ?? 0)", longitude: "\(longitude ?? 0)")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break;
                case .failure(let error):
                    self.locationForecast = .error(error)
                }
                
            } receiveValue: { (result) in
                let (locationForecast) = result
                self.locationForecast = .loaded(locationForecast)
                
            }.store(in: &bag)
    }
}
