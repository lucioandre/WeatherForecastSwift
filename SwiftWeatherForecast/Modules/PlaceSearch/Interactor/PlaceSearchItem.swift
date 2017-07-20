//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

struct PlaceSearchItem {
    let area: String
    let country: String
    let latitude: Float
    let longitude: Float
    let region: String
    let formattedName: String

    init(place:Place) {
        self.area = place.areaName
        self.country = place.country
        self.latitude = place.latitude
        self.longitude = place.longitude
        self.region = place.region
        self.formattedName = place.areaName + ", " + place.region + ", " + place.country
        print([place.areaName, place.country].joined(separator: ", "))
    }
}
