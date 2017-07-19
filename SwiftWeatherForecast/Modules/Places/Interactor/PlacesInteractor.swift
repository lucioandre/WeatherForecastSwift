//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

class PlacesInteractor: PlacesInteractorInputProtocol {
    weak var presenter: PlacesInteractorOutputProtocol?
    var APIDataManager: PlacesAPIDataManagerInputProtocol?
    var localDatamanager: PlacesLocalDataManagerInputProtocol?
    
    init() {}
}
