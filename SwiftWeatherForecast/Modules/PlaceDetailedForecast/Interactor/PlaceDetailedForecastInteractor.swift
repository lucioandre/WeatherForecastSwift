//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

class PlaceDetailedForecastInteractor: PlaceDetailedForecastInteractorInputProtocol {
    weak var presenter: PlaceDetailedForecastInteractorOutputProtocol?
    var APIDataManager: PlaceDetailedForecastAPIDataManagerInputProtocol?
    var localDatamanager: PlaceDetailedForecastLocalDataManagerInputProtocol?
    
    init() {}
}
