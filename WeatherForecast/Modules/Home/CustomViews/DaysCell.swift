//
//  DaysCell.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import SwiftUI

struct DaysCell: View {
    var timeSeries: TimeSeries
    
    var body: some View {
        HStack(){
            Image(systemName: Images.calendar)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .padding(.all, 8)
            VStack(alignment: .leading){
                Text(timeSeries.getFormattedDate())
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.white)
            }
        }
    }
}
