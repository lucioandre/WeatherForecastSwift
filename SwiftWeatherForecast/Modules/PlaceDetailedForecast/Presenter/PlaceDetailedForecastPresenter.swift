//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

class PlaceDetailedForecastPresenter: PlaceDetailedForecastPresenterProtocol, PlaceDetailedForecastInteractorOutputProtocol {
    weak var view: PlaceDetailedForecastViewProtocol?
    var interactor: PlaceDetailedForecastInteractorInputProtocol?
    var wireFrame: PlaceDetailedForecastWireframeProtocol?
    
    init() {}
}
