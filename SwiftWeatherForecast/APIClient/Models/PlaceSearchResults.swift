//
//  PlaceSearchResults.swift
//  SwiftWeatherForecast
//
//  Created by Avenue Brazil on 19/07/17.
//  Copyright © 2017 Lucio Fonseca. All rights reserved.
//

import Foundation
import Unbox

struct Place {
    let areaName: String
    let country: String
    let latitude: Float
    let longitude: Float
    let region: String
}

extension Place: Unboxable {
    init(unboxer: Unboxer) throws {
        self.areaName = try unboxer.unbox(keyPath: "areaName.0.value")
        self.country = try unboxer.unbox(keyPath: "country.0.value")
        self.latitude = try unboxer.unbox(key: "latitude")
        self.longitude = try unboxer.unbox(key: "longitude")
        self.region = try unboxer.unbox(keyPath: "region.0.value")
    }
}

struct PlaceSearchResults {
    let places: [Place]?
}

extension PlaceSearchResults: Unboxable {
    init(unboxer: Unboxer) throws {
        self.places = unboxer.unbox(keyPath: "search_api.result")
    }
}
