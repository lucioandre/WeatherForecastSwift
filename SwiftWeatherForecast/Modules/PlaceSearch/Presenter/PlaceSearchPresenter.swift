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
}
