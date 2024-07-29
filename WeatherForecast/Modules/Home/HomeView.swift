//
//  HomeView.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import SwiftUI

struct HomeView: View {
    /// view model
    @StateObject private var viewModel: HomeViewModel
    
    init(latitude: Double, longitude: Double) {
        _viewModel = StateObject(wrappedValue: HomeViewModel(latitude: latitude, longitude: longitude))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                VStack{
                    content
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                HStack{
                                    Image(systemName: Images.cloudSunFill)
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                    Text("Weather Forecast")
                                        .font(.system(size: 18, weight: .medium, design: .default))
                                        .foregroundStyle(.white)
                                }
                                
                            }
                        }
                        .toolbarBackground(.blue.opacity(0.5), for: .navigationBar)
                    
                }
                
            }
        }.accentColor(.white)
    }
    
    /// View for homeview
    @ViewBuilder private var content: some View {
        switch viewModel.locationForecast {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView().scaleEffect(2.0)
        case .loaded(let locationForecast):
            loadedView(timeSeries: locationForecast.properties?.timeseries ?? [TimeSeries]())
        case .error(let error):
            ErrorView(error: error, retryAction: {
                viewModel.fetchLocationForecast()
                viewModel.fetchLocationForecast()
            })
        }
    }
    
    /// List view when locationForecast is fetched from the API
    /// - Parameters:
    ///   - timeSeries: fetched timeSeries from API
    /// - Returns: list view
    func loadedView(timeSeries: [TimeSeries]) -> some View {
        var seen = Set<String>()
        let filteredTimeSeries = timeSeries.filter { seen.insert($0.getFormattedDate()).inserted }
        
        return List {
            ForEach(filteredTimeSeries, id: \.time) { time in
                let dayWiseTimeSeries = timeSeries.filter({$0.getFormattedDate() == time.getFormattedDate()})
                NavigationLink(destination: DetailView(dayWiseTimeSeries: dayWiseTimeSeries)) {
                    DaysCell(timeSeries: time)
                }
            }.listRowBackground(Color.clear)
            
        }.scrollContentBackground(.hidden)
            .background(Color.clear)
            .refreshable {
                viewModel.fetchLocationForecast()
            }
    }
    
}
