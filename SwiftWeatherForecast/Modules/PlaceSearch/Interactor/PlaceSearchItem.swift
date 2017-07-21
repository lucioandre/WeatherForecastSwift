//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

struct PlaceSearchItem {
    let city: String
    let latitude: Float
    let longitude: Float
    let region: String
    let fullName: String

    init(place:Place) {
        self.city = place.areaName
        self.latitude = place.latitude
        self.longitude = place.longitude
        self.region = [place.region, place.country].joined(separator: ", ")
        self.fullName = [place.areaName, place.region, place.country].joined(separator: ", ")
    }
}
