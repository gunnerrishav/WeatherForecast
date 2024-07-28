//
//  UserRouter.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation

enum UserRouter: APICall {
    
    case locationForecast(String, String)
    
    var path: String {
        switch self {
        case .locationForecast(let latitude, let longitude): return "/locationforecast/2.0/compact?lat=\(latitude)&lon=\(longitude)"
            
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default: return HTTPMethod.get
        }
    }
    
    var headers: [String : String]? {
        ///Create a config file, add token string and use token in case of Authorization requirement
        //assert(!Config.token.isEmpty, "Add your token in Config.token")
        return [
            "Accept": "application/json",
            //"Authorization": Config.token
        ]
    }
    
    func body() throws -> Data? {
        switch self {
        default: return nil
        }
    }
}
