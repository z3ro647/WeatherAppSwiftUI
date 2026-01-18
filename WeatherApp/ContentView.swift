//
//  ContentView.swift
//  WeatherApp
//
//  Created by Vivek Kumar Gurung on 2026-01-17.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var weatherViewModel = WeatherViewModel()

      var body: some View {
          VStack(spacing: 20) {

              TextField("Enter city", text: $weatherViewModel.city)
                  .textFieldStyle(.roundedBorder)
                  .padding()
                  .onSubmit {
                      weatherViewModel.fetchWeather()
                  }

              Button("Search") {
                  weatherViewModel.fetchWeather()
              }

              if let weather = weatherViewModel.weather {
                  Text("Weather in \(weather.name)")
                      .font(.title)

                  Text("\(Int(weather.main.temp.rounded()))°C")
                      .font(.system(size: 64, weight: .bold))

                  Text(weather.weather.first?.description.capitalized ?? "")
                      .font(.title3)
                      .foregroundColor(.gray)
              }
          }
          .padding()
      }
}

#Preview {
    ContentView()
}
