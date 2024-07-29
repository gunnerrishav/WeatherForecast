//
//  DateTimeUtils.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import Foundation

enum DateTimeFormats: String{
    case yyyyMMddTHHmmssSSSZ = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case yyyyMMddTHHmmSSZ = "yyyy-MM-dd'T'HH:mm:SSZ"
    case MMMdyyyy = "MMM d, yyyy"
    case EEEddMMMyyyy = "EEE dd MMM, yyyy"
}

class DateTimeUtils {
    static func getFormattedDateFromInputDate(date: String, inputFormat: String, outputFormat: String) ->String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = inputFormat
        dateFormatterGet.locale = Locale(identifier: "en_US")
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = outputFormat
        dateFormatterPrint.locale = Locale(identifier: "en_US")
        
        if let date = dateFormatterGet.date(from: date) {
            return(dateFormatterPrint.string(from: date))
        } else {
            print("There was an error decoding the string")
            return ""
        }
    }
}
