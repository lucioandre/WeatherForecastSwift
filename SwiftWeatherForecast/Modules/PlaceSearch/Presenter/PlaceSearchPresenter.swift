//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

class PlaceSearchPresenter: PlaceSearchPresenterProtocol, PlaceSearchInteractorOutputProtocol {
    weak var view: PlaceSearchViewProtocol?
    var interactor: PlaceSearchInteractorInputProtocol?
    var wireFrame: PlaceSearchWireframeProtocol?
    
    init() {}

    func searchEvent(searchKey:String?) {
        self.view?.showProgressIndicator()
        if searchKey != nil && searchKey != "" {
            self.interactor?.searchPlaces(searchKey: searchKey!, completion: { (places: [PlaceSearchItem]) in
                self.view?.removeProgressIndicator()
                self.view?.showPlaces(places: places)
            })
        }
    }
}
