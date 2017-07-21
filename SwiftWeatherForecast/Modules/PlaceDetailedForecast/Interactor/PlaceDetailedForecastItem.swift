//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

let degreeToken = "º"

struct WeatherDayConditionItem {
    let weekDay: String
    let weatherIconUrlString: String
    let maxTemperatureC: String
    let maxTemperatureF: String
    let minTemperatureC: String
    let minTemperatureF: String

    init(weekDayConditionAPI: WeatherDayCondition) {

        DateFormatter.sharedInstance.dateFormat = "EEEE"

        self.weekDay = DateFormatter.sharedInstance.string(from: weekDayConditionAPI.date)
        self.weatherIconUrlString = weekDayConditionAPI.weatherIconUrlString
        self.maxTemperatureC = weekDayConditionAPI.maxTemperatureC + degreeToken
        self.maxTemperatureF = weekDayConditionAPI.maxTemperatureF + degreeToken
        self.minTemperatureC = weekDayConditionAPI.minTemperatureC + degreeToken
        self.minTemperatureF = weekDayConditionAPI.minTemperatureF + degreeToken
    }
}

struct WeatherCurrentConditionItem {
    let weatherDescription: String
    let weatherIconUrlString: String
    let temperatureC: String
    let temperatureF: String

    init(currentConditionAPI: WeatherCurrentCondition) {
        self.weatherDescription = currentConditionAPI.weatherDescription
        self.weatherIconUrlString = currentConditionAPI.weatherIconUrlString
        self.temperatureC = currentConditionAPI.temperatureC
        self.temperatureF = currentConditionAPI.temperatureF
    }
}

struct PlaceDetailedForecastItem {
    let currentCondition: WeatherCurrentConditionItem
    let daysForecast: [WeatherDayConditionItem]
    let place: PlaceSearchItem

    init(detailedForecastAPI: PlaceDetailedForecastAPIResult) {
        self.currentCondition = WeatherCurrentConditionItem(currentConditionAPI: detailedForecastAPI.currentCondition)
        self.place = PlaceSearchItem(place: detailedForecastAPI.place)

        var days = [WeatherDayConditionItem]()
        for conditionAPI in detailedForecastAPI.daysForecast {
            let dayConditionItem = WeatherDayConditionItem(weekDayConditionAPI: conditionAPI)
            days.append(dayConditionItem)
        }
        self.daysForecast = days
    }
}
