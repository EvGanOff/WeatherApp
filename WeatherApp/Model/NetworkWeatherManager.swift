//
//  NetworkWeatherManager.swift
//  WeatherApp
//
//  Created by Евгений Ганусенко on 1/28/22.
//

import Foundation

struct NetworkWeatherManager {

    func fetchURL(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey )"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                self.parseJSON(withData: data)
            }
        }
        task.resume()
    }

    func parseJSON(withData data: Data) {
        let decoder = JSONDecoder()
        do {
           let modelData = try decoder.decode(ModelData.self, from: data)
            print(modelData.main.temp)
        } catch let error as NSError {
            print(error.localizedDescription)
            
        }
    }
}
