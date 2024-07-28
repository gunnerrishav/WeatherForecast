//
//  Properties.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation

struct Properties: Codable {
    let meta: Meta?
    let timeseries: [TimeSeries]?
    
    enum CodingKeys: String, CodingKey {
        case meta
        case timeseries
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
        timeseries = try values.decodeIfPresent([TimeSeries].self, forKey: .timeseries)
        
    }
}
