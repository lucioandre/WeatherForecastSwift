//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

protocol PlacesViewProtocol: class {
    var presenter: PlacesPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol PlacesWireframeProtocol: class {
    static func presentPlacesModule(fromView view: UIViewController)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol PlacesPresenterProtocol: class {
    var view: PlacesViewProtocol? { get set }
    var interactor: PlacesInteractorInputProtocol? { get set }
    var wireFrame: PlacesWireframeProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
}

protocol PlacesInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol PlacesInteractorInputProtocol: class {
    var presenter: PlacesInteractorOutputProtocol? { get set }
    var APIDataManager: PlacesAPIDataManagerInputProtocol? { get set }
    var localDatamanager: PlacesLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol PlacesAPIDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol PlacesLocalDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
