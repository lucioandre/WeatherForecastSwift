//
//  File.swift
//  SwiftWeatherForecast
//
//  Created by Avenue Brazil on 19/07/17.
//  Copyright © 2017 Lucio Fonseca. All rights reserved.
//

import Foundation
import Alamofire

protocol PlaceSearchAPIClientProtocol: class {
    func fetchPlaces(searchKey:String, completion: @escaping (_ response: PlaceSearchResults?, _ error: Error?) -> Swift.Void)
}

protocol PlaceDetailedForecastAPIClientProtocol: class {
    func fetchDetailedForecastForLocation(locationDescription: String, completion: @escaping (PlaceDetailedForecastAPIResult?, Error?) -> Void)
}
