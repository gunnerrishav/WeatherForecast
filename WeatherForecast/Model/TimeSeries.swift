//
//  TimeSeries.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation

struct TimeSeries: Codable {
    let time: String
    let data: TimeSeriesData
    
    enum CodingKeys: String, CodingKey {
        case time
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        time = try values.decode(String.self, forKey: .time)
        data = try values.decode(TimeSeriesData.self, forKey: .data)
    }
}

struct TimeSeriesData: Codable {
    let instant: Instant
    
    enum CodingKeys: String, CodingKey {
        case instant
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        instant = try values.decode(Instant.self, forKey: .instant)
    }
}

struct Instant: Codable {
    let details: Detail
    
    enum CodingKeys: String, CodingKey {
        case details
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        details = try values.decode(Detail.self, forKey: .details)
    }
}
