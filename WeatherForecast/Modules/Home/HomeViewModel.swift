//
//  HomeViewModel.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation

class HomeViewModel: BaseViewModel {
    
    /// holds the state and data of locationForecast
    @Published var locationForecast: LoadingState<LocationForecast> = .idle
    
    /// holds instance of locationForecast manager for API Call
    let locationForecastManager = LocationForecastManager.shared
    
    override init() {
        super.init()
        fetchLocationForecast()
    }
    
    /// Fetch locationForecast from API
    func fetchLocationForecast() {
        locationForecast = .loading
        locationForecastManager.fetchLocationForecast(latitude: "27.7172", longitude: "85.3240")  ///TODO Static latitude, longitude for now
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
