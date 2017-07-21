//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

class PlaceDetailedForecastPresenter: PlaceDetailedForecastPresenterProtocol, PlaceDetailedForecastInteractorOutputProtocol {
    weak var view: PlaceDetailedForecastViewProtocol?
    var interactor: PlaceDetailedForecastInteractorInputProtocol?
    var wireFrame: PlaceDetailedForecastWireframeProtocol?
    var latitude: Float = 0, longitude:Float = 0

    init(latitude: Float, longitude: Float) {
        self.latitude = latitude
        self.longitude = longitude
    }

    func viewWillAppearEvent() {
        self.view?.showProgressIndicator()
        self.loadDetailedWeatherForecast()
    }

    func loadDetailedWeatherForecast() {
        self.view?.showProgressIndicator()
        self.interactor?.loadDetailedForecast(latitude: self.latitude, longitude: self.longitude, completion: { (response: PlaceDetailedForecastItem?) in
            self.view?.removeProgressIndicator()
            if let apiResponse = response {
                self.view?.presentWeatherForecast(detailedForecastItem: apiResponse)
            }
        })
    }
}
