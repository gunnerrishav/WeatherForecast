//
//  APIManagerTests.swift
//  WeatherForecastTests
//
//  Created by Rishab Maharjan on 29/07/2024.
//

import Foundation
import XCTest
import Combine
@testable import WeatherForecast

final class APIManagerTests: XCTestCase {
    func testFetchLocationForecast(){
        //Given (Arrange)
        let latitude = 27.7172
        let longitude = 85.3240
        
        let locationForecastManager = LocationForecastManager.shared
        
        let baseViewModel: BaseViewModel
        
        func fetchLocationForecast() {
            locationForecastManager.fetchLocationForecast(latitude: "\(latitude)", longitude: "\(longitude)")
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    switch completion {
                    case .finished:
                        break;
                    case .failure(let error):
                        XCTFail("Request failed with error: \(error)")
                    }
                    
                } receiveValue: { (result) in
                    let (locationForecast) = result
                    XCTAssertEqual(result.type, "")
                    
                }.store(in: &baseViewModel.bag)
        }
        
    }
}
