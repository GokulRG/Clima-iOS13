//
//  Weather.swift
//  Clima
//
//  Created by Gokul Rama on 1/28/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

// Codable = Encodable & Decodable (Typealias)
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [WeatherInfo]
}

struct Main: Codable {
    let temp: Double
}

struct WeatherInfo: Codable {
    let id: Int
}
