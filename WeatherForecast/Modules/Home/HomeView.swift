//
//  HomeView.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import SwiftUI

struct HomeView: View {
    /// view model
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                VStack{
                    content
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                HStack{
                                    Image(systemName: "cloud.sun.fill")
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                    Text("Weather Forecast")
                                }
                                
                            }
                        }
                }
                
            }
        }
        
    }
    
    /// View for homeview
    @ViewBuilder private var content: some View {
        switch viewModel.locationForecast {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView().scaleEffect(2.0)
        case .loaded(let locationForecast):
            MessageView(message: locationForecast.type ?? "")
        case  .error(let error):
            ErrorView(error: error, retryAction: {
                viewModel.fetchLocationForecast()
            })
        }
    }
}

//#Preview {
//    HomeView()
//}
