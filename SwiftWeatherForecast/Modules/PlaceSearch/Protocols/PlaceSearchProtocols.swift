//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

protocol PlaceSearchViewProtocol: class {
    var presenter: PlaceSearchPresenterProtocol? { get set }
    func showPlaces(places:[PlaceSearchItem]?)
    func showProgressIndicator()
    func removeProgressIndicator()
}

protocol PlaceSearchWireframeProtocol: class {
    var view: PlaceSearchViewProtocol? { get set }
    static func presentPlaceSearchModule(fromView view: UIViewController)
    func presentDetailedForecastForLocation(locationDescription: String)
}

protocol PlaceSearchPresenterProtocol: class {
    var view: PlaceSearchViewProtocol? { get set }
    var interactor: PlaceSearchInteractorInputProtocol? { get set }
    var wireFrame: PlaceSearchWireframeProtocol? { get set }

    func searchEvent(searchKey:String?)
    func didSelectPlaceEvent(row: Int)
}

protocol PlaceSearchInteractorOutputProtocol: class {

}

protocol PlaceSearchInteractorInputProtocol: class {
    var presenter: PlaceSearchInteractorOutputProtocol? { get set }
    var apiDataManager: PlaceSearchAPIClientProtocol? { get set }
    var localDatamanager: PlaceSearchLocalDataManagerInputProtocol? { get set }

    func searchPlaces(searchKey:String, completion: @escaping (_ response: [PlaceSearchItem]) -> Swift.Void)
}

protocol PlaceSearchLocalDataManagerInputProtocol: class {

}
