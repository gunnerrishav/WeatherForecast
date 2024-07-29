//
//  TimeSeries.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation

struct TimeSeries: Codable {
    let time: String?
    let data: TimeSeriesData?
    
    func getFormattedDate() -> String {
        let formattedDate = DateTimeUtils.getFormattedDateFromInputDate(date: time ?? "", inputFormat: DateTimeFormats.yyyyMMddTHHmmSSZ.rawValue, outputFormat: DateTimeFormats.EEEddMMMyyyy.rawValue)
        return formattedDate
    }
    
    enum CodingKeys: String, CodingKey {
        case time
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        time = try values.decodeIfPresent(String.self, forKey: .time)
        data = try values.decodeIfPresent(TimeSeriesData.self, forKey: .data)
    }
}

struct TimeSeriesData: Codable {
    let instant: Instant?
    let nextOneHours: NextOneHours?
    
    enum CodingKeys: String, CodingKey {
        case instant
        case nextOneHours = "next_1_hours"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        instant = try values.decodeIfPresent(Instant.self, forKey: .instant)
        nextOneHours = try values.decodeIfPresent(NextOneHours.self, forKey: .nextOneHours)
    }
}

struct Instant: Codable {
    let details: Detail?
    
    enum CodingKeys: String, CodingKey {
        case details
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        details = try values.decodeIfPresent(Detail.self, forKey: .details)
    }
}

struct NextOneHours: Codable {
    let summary: Summary?
    
    enum CodingKeys: String, CodingKey {
        case summary
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        summary = try values.decodeIfPresent(Summary.self, forKey: .summary)
    }
}

struct Summary: Codable {
    let symbolCode: String?
    
    enum CodingKeys: String, CodingKey {
        case symbolCode = "symbol_code"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        symbolCode = try values.decodeIfPresent(String.self, forKey: .symbolCode)
    }
}
