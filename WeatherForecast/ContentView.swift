//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Jesus Daniel Medina Cruz on 23/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      HStack {
        DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
        
        DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
      }
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
  let day: String
  let isRainy: Bool
  let high: Int
  let low: Int
  
  var iconName: String {
    if isRainy {
      return "cloud.rain.fill"
    } else {
      return "sun.max.fill"
    }
  }
  
  var iconColor: Color {
    if isRainy {
      return .blue
    } else {
      return .yellow
    }
  }
  
  var body: some View {
    VStack {
      Text(day)
      Image(systemName: iconName)
        .foregroundColor(iconColor)
        .font(Font.largeTitle)
        .padding(5)
      Text("High: \(high)")
        .fontWeight(Font.Weight.semibold)
      Text("Low: \(low)")
        .fontWeight(Font.Weight.medium)
        .foregroundStyle(Color.secondary)
    }
    .padding()
  }
}

#Preview {
  DayForecast(day: "Mon", isRainy: false, high: 30, low: 20)
}
