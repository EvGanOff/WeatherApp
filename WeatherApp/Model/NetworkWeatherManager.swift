//
//  NetworkWeatherManager.swift
//  WeatherApp
//
//  Created by Евгений Ганусенко on 1/28/22.
//

import Foundation

class NetworkWeatherManager {

    var onComplition: ((CurrentWeather) -> Void)?

    func fetchURL(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onComplition?(currentWeather) 
                }
            }
        }
        task.resume()
    }

    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
           let modelData = try decoder.decode(ModelData.self, from: data)
            guard let currentWeather = CurrentWeather(weatherData: modelData) else { return nil }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
