//
//  Meta.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation

struct Meta: Codable {
    let updatedAt: String
    let units: Unit
    
    enum CodingKeys: String, CodingKey {
        case updatedAt = "updated_at"
        case units
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        updatedAt = try values.decode(String.self, forKey: .updatedAt)
        units = try values.decode(Unit.self, forKey: .units)
        
    }
}
