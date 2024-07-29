//
//  DetailViewModel.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 29/07/2024.
//

import Foundation

class DetailViewModel: BaseViewModel{
    /// holds the timeSeries list of a particular day
    let dayWiseTimeSeries: [TimeSeries]?
    
    init(dayWiseTimeSeries: [TimeSeries]) {
        self.dayWiseTimeSeries = dayWiseTimeSeries
        super.init()
    }
    
    func getFormattedTime(time: String) -> String{
        let formattedTime = DateTimeUtils.getFormattedDateFromInputDate(date: time, inputFormat: DateTimeFormats.yyyyMMddTHHmmSSZ.rawValue, outputFormat: DateTimeFormats.hhmma.rawValue)
        return formattedTime
    }
    
}
