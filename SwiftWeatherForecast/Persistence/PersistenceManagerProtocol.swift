//
//  PersistenceManagerProtocols.swift
//  SwiftWeatherForecast
//
//  Created by Avenue Brazil on 20/07/17.
//  Copyright © 2017 Lucio Fonseca. All rights reserved.
//

import Foundation

protocol PlacesPersistenceManagerProtocol: class {
    func storePlace(place:PlaceSearchResults, completion: () -> Swift.Void)
    func deletePlace(place:PlaceSearchResults, completion: () -> Swift.Void)
    func fetchPlaces()
}
