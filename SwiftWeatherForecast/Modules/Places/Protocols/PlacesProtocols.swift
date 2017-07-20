//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

protocol PlacesViewProtocol: class {
    var presenter: PlacesPresenterProtocol? { get set }
}

protocol PlacesWireframeProtocol: class {
    var view:PlacesViewProtocol? { get set }
    static func presentPlacesModule(fromView view: UIViewController)
    func navigateToPlaceSearch()
}

protocol PlacesPresenterProtocol: class {
    var view: PlacesViewProtocol? { get set }
    var interactor: PlacesInteractorInputProtocol? { get set }
    var wireFrame: PlacesWireframeProtocol? { get set }

    func addPresenterEvent()
}

protocol PlacesInteractorOutputProtocol: class {

}

protocol PlacesInteractorInputProtocol: class {
    var presenter: PlacesInteractorOutputProtocol? { get set }
    var APIDataManager: PlacesAPIDataManagerInputProtocol? { get set }
    var localDatamanager: PlacesLocalDataManagerInputProtocol? { get set }
}

protocol PlacesAPIDataManagerInputProtocol: class {

}

protocol PlacesLocalDataManagerInputProtocol: class {

}
