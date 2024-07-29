//
//  DetailView.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import SwiftUI

struct DetailView: View {
    /// view model
    @StateObject private var viewModel: DetailViewModel
    
    init(dayWiseTimeSeries: [TimeSeries]) {
        _viewModel = StateObject(wrappedValue: DetailViewModel(dayWiseTimeSeries: dayWiseTimeSeries))
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 8){
                Text(viewModel.dayWiseTimeSeries?.first?.getFormattedDate() ?? "")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .foregroundStyle(.white)
                Image(viewModel.dayWiseTimeSeries?.first?.data?.nextOneHours?.summary?.symbolCode ?? Images.fairyDay)
                    .renderingMode(.original)
                    .resizable()
                    .foregroundStyle(.pink)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                Text("\(Int(viewModel.dayWiseTimeSeries?.first?.data?.instant?.details?.airTemperature ?? 0))°")
                    .font(.system(size: 52, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                
                loadedView(timeSeries: viewModel.dayWiseTimeSeries ?? [])
            }
        }
    }
    
    func loadedView(timeSeries: [TimeSeries]) -> some View {
        return List {
            ForEach(timeSeries, id: \.time) { time in
                TimeCell(timeSeries: time, formattedTime: viewModel.getFormattedTime(time: time.time ?? ""))
            }.listRowBackground(Color.clear)
            
        }.scrollContentBackground(.hidden)
            .background(Color.clear)
    }
    
}

