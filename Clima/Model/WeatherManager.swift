//
//  WeatherManager.swift
//  Clima
//
//  Created by Gokul Rama on 1/28/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager:WeatherManager, _ weather: WeatherModel)
    func didFailWithError(with error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=ea6bd3dfe3a58efc442b8c9d38506257&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // Step 1: Create a URL with a URL String - Since strings are fraught with typos this generates an optional URL? so we use an if-let
        if let url = URL(string: urlString) {
            
            // Step 2: Create a URLSession
            let session = URLSession(configuration: .default)
            
            // Step 3: Give the session a task
            let task = session.dataTask(with: url){ (data, response, error) -> Void in
                if error != nil {
                    // Pass error to delegate
                    self.delegate?.didFailWithError(with: error!)
                    return
                }
                
                if let safeData = data {
                    // Parse it into a Swift Object
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weather)
                    }
                }
            }
            
            // Step 4: Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            return WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
        } catch {
            delegate?.didFailWithError(with: error)
            return nil
        }
    }
    
}
