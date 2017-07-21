//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

class PlaceDetailedForecastPresenter: PlaceDetailedForecastPresenterProtocol, PlaceDetailedForecastInteractorOutputProtocol {
    weak var view: PlaceDetailedForecastViewProtocol?
    var interactor: PlaceDetailedForecastInteractorInputProtocol?
    var wireFrame: PlaceDetailedForecastWireframeProtocol?
    var locationDescription: String

    init(locationDescription: String) {
        self.locationDescription = locationDescription
    }

    func viewWillAppearEvent() {
        self.view?.showProgressIndicator()
        self.loadDetailedWeatherForecast()
    }

    func loadDetailedWeatherForecast() {
        self.view?.showProgressIndicator()
        self.interactor?.loadDetailedForecast(locationDescription: self.locationDescription, completion: { (response: PlaceDetailedForecastItem?) in
            self.view?.removeProgressIndicator()
            if let apiResponse = response {
                self.view?.presentWeatherForecast(detailedForecastItem: apiResponse)
            }
        })
    }
}
