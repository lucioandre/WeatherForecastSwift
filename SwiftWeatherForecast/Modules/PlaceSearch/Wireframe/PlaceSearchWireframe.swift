//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

class PlaceSearchWireframe: PlaceSearchWireframeProtocol {
    var view:PlaceSearchViewProtocol?

    class func presentPlaceSearchModule(fromView view: UIViewController) {
        let placeSearchView = PlaceSearchWireframe.configureViewController()
        view.navigationController?.pushViewController(placeSearchView, animated: true)
    }

    class func configureViewController() -> UIViewController {
        // Generating module components
        let view: PlaceSearchViewProtocol = PlaceSearchView()
        let presenter: PlaceSearchPresenterProtocol & PlaceSearchInteractorOutputProtocol = PlaceSearchPresenter()
        let interactor: PlaceSearchInteractorInputProtocol = PlaceSearchInteractor()
        let APIDataManager: PlaceSearchAPIClientProtocol = APIClient()
        let wireFrame: PlaceSearchWireframeProtocol = PlaceSearchWireframe()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.apiDataManager = APIDataManager
        wireFrame.view = view

        return view as! UIViewController
    }

    //MARK: Navigation Methods

    func presentDetailedForecastForLocation(locationDescription: String) {
        PlaceDetailedForecastWireframe.presentPlaceDetailedForecastModule(fromView: self.view as! UIViewController, locationDescription)
    }
}
