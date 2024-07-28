//
//  Detail.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation

struct Detail: Codable {
    let airPressureAtSeaLevel: Double?
    let airTemperature: Double?
    let cloudAreaFraction: Double?
    let precipitationAmmount: Double?
    let relativeHumidity: Double?
    let windFromDirection: Double?
    let windSpeed: Double?
    
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
        airPressureAtSeaLevel = try values.decodeIfPresent(Double.self, forKey: .airPressureAtSeaLevel)
        airTemperature = try values.decodeIfPresent(Double.self, forKey: .airTemperature)
        cloudAreaFraction = try values.decodeIfPresent(Double.self, forKey: .cloudAreaFraction)
        precipitationAmmount = try values.decodeIfPresent(Double.self, forKey: .precipitationAmmount)
        relativeHumidity = try values.decodeIfPresent(Double.self, forKey: .relativeHumidity)
        windFromDirection = try values.decodeIfPresent(Double.self, forKey: .windFromDirection)
        windSpeed = try values.decodeIfPresent(Double.self, forKey: .windSpeed)
    }
}
