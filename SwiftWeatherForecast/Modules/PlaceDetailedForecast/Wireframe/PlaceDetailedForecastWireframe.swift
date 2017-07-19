//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

class PlaceDetailedForecastWireframe: PlaceDetailedForecastWireframeProtocol {
    class func presentPlaceDetailedForecastModule(fromView view: UIViewController) {
        let placeDetailedForecastView = PlaceDetailedForecastWireframe.configureViewController()
        view.navigationController?.pushViewController(placeDetailedForecastView, animated: true)
    }

    class func configureViewController() -> UIViewController {
        // Generating module components
        let view: PlaceDetailedForecastViewProtocol = PlaceDetailedForecastView()
        let presenter: PlaceDetailedForecastPresenterProtocol & PlaceDetailedForecastInteractorOutputProtocol = PlaceDetailedForecastPresenter()
        let interactor: PlaceDetailedForecastInteractorInputProtocol = PlaceDetailedForecastInteractor()
        let APIDataManager: PlaceDetailedForecastAPIDataManagerInputProtocol = PlaceDetailedForecastAPIDataManager()
        let localDataManager: PlaceDetailedForecastLocalDataManagerInputProtocol = PlaceDetailedForecastLocalDataManager()
        let wireFrame: PlaceDetailedForecastWireframeProtocol = PlaceDetailedForecastWireframe()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager

        return view as! UIViewController
    }
}
