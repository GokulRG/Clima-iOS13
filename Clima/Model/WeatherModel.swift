//
//  WeatherModel.swift
//  Clima
//
//  Created by Gokul Rama on 1/28/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    // Computed Property
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    // Computed Property
    var conditionName: String {
        switch conditionId {
        case 801... :
            return "cloud.fill"
        case 800 :
            return "sun.max"
        case 781:
            return "tornado"
        case 771:
            return "wind"
        case 711:
            return "smoke"
        case 751,761,762:
            return "sun.dust"
        case 701,741:
            return "cloud.fog"
        case 721:
            return "sun.haze"
        case 600:
            return "cloud.snow"
        case 601,602:
            return "snow"
        case 611,612,613:
            return "cloud.sleet"
        case 615,616,620,621,622,511:
            return "cloud.hail"
        case 500,521:
            return "cloud.rain"
        case 501,502,503,504,522,531:
            return "cloud.heavyrain"
        case 520:
            return "cloud.sun.rain"
        case 300...322:
            return "cloud.drizzle"
        case 200,201,202,230,231,232:
            return "cloud.bolt.rain"
        case 210,211,212,221:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
