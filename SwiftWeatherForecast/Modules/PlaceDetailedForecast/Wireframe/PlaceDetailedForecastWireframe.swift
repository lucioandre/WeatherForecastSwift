//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

class PlaceDetailedForecastWireframe: PlaceDetailedForecastWireframeProtocol {
    class func presentPlaceDetailedForecastModule(fromView view: UIViewController, _ latitude:Float, _ longitude:Float) {
        let placeDetailedForecastView = PlaceDetailedForecastWireframe.configureViewController(latitude: latitude, longitude: longitude)
        view.navigationController?.pushViewController(placeDetailedForecastView, animated: true)
    }

    private class func configureViewController(latitude: Float, longitude: Float) -> UIViewController {
        // Generating module components
        let view: PlaceDetailedForecastViewProtocol = PlaceDetailedForecastView()
        let presenter: PlaceDetailedForecastPresenterProtocol & PlaceDetailedForecastInteractorOutputProtocol = PlaceDetailedForecastPresenter(latitude: latitude, longitude: longitude)
        let interactor: PlaceDetailedForecastInteractorInputProtocol = PlaceDetailedForecastInteractor()
        let apiDataManager: PlaceDetailedForecastAPIClientProtocol = APIClient()
        let localDataManager: PlaceDetailedForecastLocalDataManagerInputProtocol = PlaceDetailedForecastLocalDataManager()
        let wireFrame: PlaceDetailedForecastWireframeProtocol = PlaceDetailedForecastWireframe()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.apiDataManager = apiDataManager
        interactor.localDatamanager = localDataManager

        return view as! UIViewController
    }
}
