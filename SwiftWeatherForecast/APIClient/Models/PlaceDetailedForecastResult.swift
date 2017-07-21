//
//  PlaceDetailedForecastResult.swift
//  SwiftWeatherForecast
//
//  Created by Avenue Brazil on 20/07/17.
//  Copyright © 2017 Lucio Fonseca. All rights reserved.
//

import Foundation
import Unbox

//MARK: Day Average Condition

struct WeatherDayCondition {
    let date: Date
    let weatherIconUrlString: String
    let maxTemperatureC: String
    let maxTemperatureF: String
    let minTemperatureC: String
    let minTemperatureF: String
}

extension WeatherDayCondition: Unboxable {
    init(unboxer: Unboxer) throws {
        DateFormatter.sharedInstance.dateFormat = "YYYY-MM-dd"
        self.date = try unboxer.unbox(key: "date", formatter: DateFormatter.sharedInstance)
        self.weatherIconUrlString = try unboxer.unbox(keyPath: "hourly.0.weatherIconUrl.0.value")
        self.maxTemperatureC = try unboxer.unbox(key: "maxtempC")
        self.maxTemperatureF = try unboxer.unbox(key: "maxtempF")
        self.minTemperatureC = try unboxer.unbox(key: "mintempC")
        self.minTemperatureF = try unboxer.unbox(key: "mintempF")
    }
}

//MARK: Current Condition

struct WeatherCurrentCondition {
    let weatherDescription: String
    let weatherIconUrlString: String
    let temperatureC: String
    let temperatureF: String
}

extension WeatherCurrentCondition: Unboxable {
    init(unboxer: Unboxer) throws {
        self.weatherDescription = try unboxer.unbox(keyPath: "weatherDesc.0.value")
        self.weatherIconUrlString = try unboxer.unbox(keyPath: "weatherIconUrl.0.value")
        self.temperatureC = try unboxer.unbox(key: "temp_C")
        self.temperatureF = try unboxer.unbox(key: "temp_F")
    }
}

//MARK: Detailed Forecast

struct PlaceDetailedForecastAPIResult {
    let currentCondition: WeatherCurrentCondition
    let daysForecast: [WeatherDayCondition]
    let place: Place
}

extension PlaceDetailedForecastAPIResult: Unboxable {
    init(unboxer: Unboxer) throws {
        self.place = try unboxer.unbox(keyPath: "data.nearest_area.0")
        self.daysForecast = try unboxer.unbox(keyPath: "data.weather")
        self.currentCondition = try unboxer.unbox(keyPath: "data.current_condition.0")
    }
}
