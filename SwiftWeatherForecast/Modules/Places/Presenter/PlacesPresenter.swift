//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

class PlacesPresenter: PlacesPresenterProtocol, PlacesInteractorOutputProtocol {
    weak var view: PlacesViewProtocol?
    var interactor: PlacesInteractorInputProtocol?
    var wireFrame: PlacesWireframeProtocol?

    func addPresenterEvent() {
        self.wireFrame?.navigateToPlaceSearch()
    }
    
    init() {}
}
