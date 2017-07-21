//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

class PlaceDetailedForecastInteractor: PlaceDetailedForecastInteractorInputProtocol {
    weak var presenter: PlaceDetailedForecastInteractorOutputProtocol?
    var apiDataManager: PlaceDetailedForecastAPIClientProtocol?
    var localDatamanager: PlaceDetailedForecastLocalDataManagerInputProtocol?
    
    init() {}

    func loadDetailedForecast(locationDescription: String, completion: @escaping (_ response: PlaceDetailedForecastItem?) -> Swift.Void) {
        apiDataManager?.fetchDetailedForecastForLocation(locationDescription: locationDescription, completion: { (response: PlaceDetailedForecastAPIResult?, error:Error?) in
            if let apiResponse = response {
                let detailedForecastItem = PlaceDetailedForecastItem(detailedForecastAPI: apiResponse)
                completion(detailedForecastItem)
            } else {
                completion(nil)
            }
        })
    }
}
