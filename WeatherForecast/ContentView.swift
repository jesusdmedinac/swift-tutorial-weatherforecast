//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Jesus Daniel Medina Cruz on 23/07/25.
//

import SwiftUI

struct Day: Identifiable {
  var id: String { name }
  
  let name: String
  let isRainy: Bool
  let high: Int
  let low: Int
}

struct ContentView: View {
  let days = [
    Day(name: "Mon", isRainy: true, high: 100, low: 80),
    Day(name: "Tue", isRainy: false, high: 80, low: 60),
    Day(name: "Wed", isRainy: true, high: 60, low: 40),
    Day(name: "Thu", isRainy: false, high: 40, low: 20),
    Day(name: "Fri", isRainy: true, high: 20, low: 0),
    Day(name: "Sat", isRainy: false, high: 0, low: -20),
    Day(name: "Sun", isRainy: true, high: -20, low: -40),
  ]
    var body: some View {
      ScrollView(.horizontal) {
        HStack {
          ForEach(days) { day in
            DayForecast(day: day.name, isRainy: day.isRainy, high: day.high, low: day.low)
          }
        }
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
  
  func temperatureColor(_ temp: Int) -> Color {
    if temp >= 80 {
      return .orange
    } else if temp >= 50 {
      return .teal
    } else {
      return .mint
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
        .foregroundStyle(temperatureColor(high))
      Text("Low: \(low)")
        .fontWeight(Font.Weight.medium)
        .foregroundStyle(temperatureColor(low))
    }
    .padding()
  }
}

#Preview {
  DayForecast(day: "Mon", isRainy: false, high: 30, low: 20)
}
