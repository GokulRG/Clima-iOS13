//
//  Weather.swift
//  Clima
//
//  Created by Gokul Rama on 1/28/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [WeatherInfo]
}

struct Main: Decodable {
    let temp: Double
}

struct WeatherInfo: Decodable {
    let description: String
}
