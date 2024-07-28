//
//  BaseViewModel.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation
import Combine

enum LoadingState<T> {
    case idle
    case loading
    case loaded(T)
    case error(Error)
}

class BaseViewModel: ObservableObject {
    var bag = Set<AnyCancellable>()
    init() {
        print("Initialized --> \(String(describing: self))")
    }
    
    deinit {
        debugPrint("De-Initialized --> \(String(describing: self))")
    }
}
