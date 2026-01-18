//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Vivek Kumar Gurung on 2026-01-17.
//

import Foundation
import Combine

private enum APIKEY {
    static let key = "d2c557e2fb0a15a77dd9aaf2f184919e" // Enter your API KEY here
}

class WeatherService {

    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"

    func getWeather(for city: String) -> AnyPublisher<WeatherResponse, Error> {
        guard let url = URL(string: "\(baseURL)?q=\(city)&appid=\(APIKEY.key)&units=metric") else {
            fatalError("Invalid URL")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
