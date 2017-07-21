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
        //Reset list whenever user taps to search something
        self.places = nil
        self.view?.showPlaces(places: places)

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
        if let p = self.places, row < p.count {
            let place = p[row]
            self.wireFrame?.presentDetailedForecastForLocation(locationDescription: place.fullName)
        }
    }
}
