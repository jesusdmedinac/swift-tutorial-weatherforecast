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
    Day(name: "Mon", isRainy: true, high: 70, low: 60),
    Day(name: "Tue", isRainy: false, high: 70, low: 60),
    Day(name: "Wed", isRainy: true, high: 70, low: 60),
    Day(name: "Thu", isRainy: false, high: 70, low: 60),
    Day(name: "Fri", isRainy: true, high: 70, low: 60),
    Day(name: "Sat", isRainy: false, high: 70, low: 60),
    Day(name: "Sun", isRainy: true, high: 70, low: 60),
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
