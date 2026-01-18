//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Vivek Kumar Gurung on 2026-01-17.
//

import Foundation

struct WeatherResponse: Codable {
  let main: Main
  let weather: [Weather]
  let name: String
}

struct Main: Codable {
  let temp: Double
}

struct Weather: Codable {
  let description: String
  let id: Int
}
