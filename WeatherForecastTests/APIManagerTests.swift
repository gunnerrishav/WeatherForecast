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
    var cancellables = Set<AnyCancellable>()
    
    func testFetchLocationForecast() {
        // Given (Arrange)
        let latitude = 27.7172
        let longitude = 85.3240
        
        let locationForecastManager = LocationForecastManager.shared
        
        // When (Act)
        let expectation = self.expectation(description: "Fetching location forecast")
        
        locationForecastManager.fetchLocationForecast(latitude: "\(latitude)", longitude: "\(longitude)")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Request failed with error: \(error)")
                }
                expectation.fulfill()
            } receiveValue: { result in
                let (locationForecast) = result
                XCTAssertEqual(locationForecast.type, "Feature")
            }
            .store(in: &cancellables)
        
        // Then (Assert)
        waitForExpectations(timeout: 5, handler: nil)
    }
}
