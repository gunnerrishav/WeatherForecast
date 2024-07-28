//
//  LocationForecast.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation

struct LocationForecast: Codable {
    let type: String
    let properties: Properties
    
    enum CodingKeys: String, CodingKey {
        case type
        case properties
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decode(String.self, forKey: .type)
        properties = try values.decode(Properties.self, forKey: .properties)
        
    }
}
