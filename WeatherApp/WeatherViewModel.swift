//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Vivek Kumar Gurung on 2026-01-17.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
  private let weatherService = WeatherService()
      private var cancellables = Set<AnyCancellable>()

      @Published var city: String = ""
      @Published var weather: WeatherResponse?
      @Published var isLoading: Bool = false
      @Published var errorMessage: String?

      func fetchWeather() {
          guard !city.isEmpty else { return }

          isLoading = true
          errorMessage = nil

          weatherService.getWeather(for: city)
              .receive(on: DispatchQueue.main)
              .sink { [weak self] completion in
                  guard let self = self else { return }
                  self.isLoading = false

                  if case let .failure(error) = completion {
                      self.errorMessage = error.localizedDescription
                  }
              } receiveValue: { [weak self] weather in
                  self?.weather = weather
              }
              .store(in: &cancellables)
      }
}
