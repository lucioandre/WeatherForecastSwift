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

    func loadDetailedForecast(latitude: Float, longitude: Float, completion: @escaping (_ response: PlaceDetailedForecastItem?) -> Swift.Void) {
        apiDataManager?.fetchDetailedForecastForCoordinate(latitude: latitude, longitude: longitude, completion: { (response: PlaceDetailedForecastAPIResult?, error:Error?) in
            if let apiResponse = response {
                let detailedForecastItem = PlaceDetailedForecastItem(detailedForecastAPI: apiResponse)
                completion(detailedForecastItem)
            } else {
                completion(nil)
            }
        })
    }
}
