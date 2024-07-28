//
//  Unit.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation

struct Unit: Codable {
    let airPressureAtSeaLevel: String
    let airTemperature: String
    let cloudAreaFraction: String
    let precipitationAmmount: String
    let relativeHumidity: String
    let windFromDirection: String
    let windSpeed: String
    
    enum CodingKeys: String, CodingKey {
        case airPressureAtSeaLevel = "air_pressure_at_sea_level"
        case airTemperature = "air_temperature"
        case cloudAreaFraction = "cloud_area_fraction"
        case precipitationAmmount = "precipitation_amount"
        case relativeHumidity = "relative_humidity"
        case windFromDirection = "wind_from_direction"
        case windSpeed = "wind_speed"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        airPressureAtSeaLevel = try values.decode(String.self, forKey: .airPressureAtSeaLevel)
        airTemperature = try values.decode(String.self, forKey: .airTemperature)
        cloudAreaFraction = try values.decode(String.self, forKey: .cloudAreaFraction)
        precipitationAmmount = try values.decode(String.self, forKey: .precipitationAmmount)
        relativeHumidity = try values.decode(String.self, forKey: .relativeHumidity)
        windFromDirection = try values.decode(String.self, forKey: .windFromDirection)
        windSpeed = try values.decode(String.self, forKey: .windSpeed)
        
    }
}
