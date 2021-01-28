//
//  WeatherManager.swift
//  Clima
//
//  Created by Gokul Rama on 1/28/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=ea6bd3dfe3a58efc442b8c9d38506257&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // Step 1: Create a URL with a URL String - Since strings are fraught with typos this generates an optional URL? so we use an if-let
        if let url = URL(string: urlString) {
            
            // Step 2: Create a URLSession
            let session = URLSession(configuration: .default)
            
            // Step 3: Give the session a task
            let task = session.dataTask(with: url){ (data, response, error) -> Void in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    // Parse it into a Swift Object
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            // Step 4: Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
    }
    
}
