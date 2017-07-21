//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

class PlaceSearchPresenter: PlaceSearchPresenterProtocol, PlaceSearchInteractorOutputProtocol {
    weak var view: PlaceSearchViewProtocol?
    var interactor: PlaceSearchInteractorInputProtocol?
    var wireFrame: PlaceSearchWireframeProtocol?
    var places: [PlaceSearchItem]?
    
    init() {}

    func searchEvent(searchKey:String?) {
        self.view?.showProgressIndicator()
        if searchKey != nil && searchKey != "" {
            self.interactor?.searchPlaces(searchKey: searchKey!, completion: { (places: [PlaceSearchItem]) in
                self.places = places
                self.view?.removeProgressIndicator()
                self.view?.showPlaces(places: places)
            })
        }
    }

    func didSelectPlaceEvent(row: Int) {
        if let place = self.places?[row] {
            self.wireFrame?.presentDetailedForecastAtCoordinates(latitude: place.latitude, longitude: place.longitude)
        }
    }
}
