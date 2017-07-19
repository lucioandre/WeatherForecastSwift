//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

class PlaceSearchInteractor: PlaceSearchInteractorInputProtocol {
    weak var presenter: PlaceSearchInteractorOutputProtocol?
    var APIDataManager: PlaceSearchAPIDataManagerInputProtocol?
    var localDatamanager: PlaceSearchLocalDataManagerInputProtocol?
    
    init() {}
}
