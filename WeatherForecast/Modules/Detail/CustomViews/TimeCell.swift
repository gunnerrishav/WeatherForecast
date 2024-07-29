//
//  TimeCell.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 29/07/2024.
//

import SwiftUI

struct TimeCell: View {
    var timeSeries: TimeSeries
    var formattedTime: String
    
    var body: some View {
        HStack(){
            Image(timeSeries.data?.nextOneHours?.summary?.symbolCode ?? Images.fairyDay)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundStyle(.white)
                .padding(.all, 8)
            VStack(alignment: .leading){
                Text(formattedTime)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.white)
                    .padding(.trailing, 8)
                Text("\(Int(timeSeries.data?.instant?.details?.airTemperature ?? 0))°")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.white)
            }
        }
    }
}
