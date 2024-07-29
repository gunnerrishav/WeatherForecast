//
//  WeatherForecastApp.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import SwiftUI

@main
struct WeatherForecastApp: App {
    @StateObject private var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            if let location = locationManager.location {
                HomeView(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            } else {
                //Text("Locating...")
            }
            
            if let authorizationStatus = locationManager.authorizationStatus {
                switch authorizationStatus {
                case .notDetermined:
                    //Text("Requesting location perpermission...")
                    Text("")
                case .restricted, .denied:
                    Text("Location access denied. Please enable it in settings.")
                case .authorizedAlways, .authorizedWhenInUse:
                    HomeView(latitude: locationManager.location?.coordinate.latitude ?? 0, longitude: locationManager.location?.coordinate.longitude ?? 0)
                @unknown default:
                    Text("Location access denied. Please enable it in settings.")
                }
            }
        }
    }
    
}
