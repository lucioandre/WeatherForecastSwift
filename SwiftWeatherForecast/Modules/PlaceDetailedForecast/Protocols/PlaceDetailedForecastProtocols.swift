//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

protocol PlaceDetailedForecastViewProtocol: class {
    var presenter: PlaceDetailedForecastPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol PlaceDetailedForecastWireframeProtocol: class {
    static func presentPlaceDetailedForecastModule(fromView view: UIViewController)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol PlaceDetailedForecastPresenterProtocol: class {
    var view: PlaceDetailedForecastViewProtocol? { get set }
    var interactor: PlaceDetailedForecastInteractorInputProtocol? { get set }
    var wireFrame: PlaceDetailedForecastWireframeProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
}

protocol PlaceDetailedForecastInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol PlaceDetailedForecastInteractorInputProtocol: class {
    var presenter: PlaceDetailedForecastInteractorOutputProtocol? { get set }
    var APIDataManager: PlaceDetailedForecastAPIDataManagerInputProtocol? { get set }
    var localDatamanager: PlaceDetailedForecastLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol PlaceDetailedForecastAPIDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol PlaceDetailedForecastLocalDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
