//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

protocol PlaceSearchViewProtocol: class {
    var presenter: PlaceSearchPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol PlaceSearchWireframeProtocol: class {
    static func presentPlaceSearchModule(fromView view: UIViewController)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol PlaceSearchPresenterProtocol: class {
    var view: PlaceSearchViewProtocol? { get set }
    var interactor: PlaceSearchInteractorInputProtocol? { get set }
    var wireFrame: PlaceSearchWireframeProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
}

protocol PlaceSearchInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol PlaceSearchInteractorInputProtocol: class {
    var presenter: PlaceSearchInteractorOutputProtocol? { get set }
    var APIDataManager: PlaceSearchAPIDataManagerInputProtocol? { get set }
    var localDatamanager: PlaceSearchLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol PlaceSearchAPIDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol PlaceSearchLocalDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
