//
//  MessageView.swift
//  WeatherForecast
//
//  Created by Rishab Maharjan on 28/07/2024.
//

import SwiftUI

struct MessageView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .font(.callout)
            .multilineTextAlignment(.center)
            .padding(.bottom, 40).padding()
    }
}
