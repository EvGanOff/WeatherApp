//
//  ModelData.swift
//  WeatherApp
//
//  Created by Евгений Ганусенко on 1/9/22.
//

import Foundation

struct ModelData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]

}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}

struct Weather: Codable {
    let id: Int
}
