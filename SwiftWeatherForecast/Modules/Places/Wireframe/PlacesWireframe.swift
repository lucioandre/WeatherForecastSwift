//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

class PlacesWireframe: PlacesWireframeProtocol {

    var view:PlacesViewProtocol?

    class func presentPlacesModule(fromView view: UIViewController) {
        let placesView = PlacesWireframe.configureViewController()
        view.navigationController?.pushViewController(placesView, animated: true)
    }

    class func configureViewController() -> UIViewController {
        // Generating module components
        let view: PlacesViewProtocol = PlacesView()
        let presenter: PlacesPresenterProtocol & PlacesInteractorOutputProtocol = PlacesPresenter()
        let interactor: PlacesInteractorInputProtocol = PlacesInteractor()
        let APIDataManager: PlacesAPIDataManagerInputProtocol = PlacesAPIDataManager()
        let localDataManager: PlacesLocalDataManagerInputProtocol = PlacesLocalDataManager()
        let wireFrame: PlacesWireframeProtocol = PlacesWireframe()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
        wireFrame.view = view

        return view as! UIViewController
    }

    //MARK: Redirection Methods

    func navigateToPlaceSearch() {
        PlaceSearchWireframe.presentPlaceSearchModule(fromView: self.view as! UIViewController)
    }
}
