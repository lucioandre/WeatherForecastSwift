//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

protocol PlaceDetailedForecastViewProtocol: class {
    var presenter: PlaceDetailedForecastPresenterProtocol? { get set }
    
}

protocol PlaceDetailedForecastWireframeProtocol: class {
    static func presentPlaceDetailedForecastModule(fromView view: UIViewController)

}

protocol PlaceDetailedForecastPresenterProtocol: class {
    var view: PlaceDetailedForecastViewProtocol? { get set }
    var interactor: PlaceDetailedForecastInteractorInputProtocol? { get set }
    var wireFrame: PlaceDetailedForecastWireframeProtocol? { get set }

}

protocol PlaceDetailedForecastInteractorOutputProtocol: class {

}

protocol PlaceDetailedForecastInteractorInputProtocol: class {
    var presenter: PlaceDetailedForecastInteractorOutputProtocol? { get set }
    var APIDataManager: PlaceDetailedForecastAPIDataManagerInputProtocol? { get set }
    var localDatamanager: PlaceDetailedForecastLocalDataManagerInputProtocol? { get set }

}

protocol PlaceDetailedForecastAPIDataManagerInputProtocol: class {

}

protocol PlaceDetailedForecastLocalDataManagerInputProtocol: class {

}
