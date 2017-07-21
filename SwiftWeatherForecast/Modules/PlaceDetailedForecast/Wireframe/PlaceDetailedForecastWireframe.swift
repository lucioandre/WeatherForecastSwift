//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

class PlaceDetailedForecastWireframe: PlaceDetailedForecastWireframeProtocol {
    class func presentPlaceDetailedForecastModule(fromView view: UIViewController, _ locationDescription: String) {
        let placeDetailedForecastView = PlaceDetailedForecastWireframe.configureViewController(locationDescription: locationDescription)
        view.navigationController?.pushViewController(placeDetailedForecastView, animated: true)
    }

    private class func configureViewController(locationDescription: String) -> UIViewController {
        // Generating module components
        let view: PlaceDetailedForecastViewProtocol = PlaceDetailedForecastView()
        let presenter: PlaceDetailedForecastPresenterProtocol & PlaceDetailedForecastInteractorOutputProtocol = PlaceDetailedForecastPresenter(locationDescription: locationDescription)
        let interactor: PlaceDetailedForecastInteractorInputProtocol = PlaceDetailedForecastInteractor()
        let apiDataManager: PlaceDetailedForecastAPIClientProtocol = APIClient()
        let wireFrame: PlaceDetailedForecastWireframeProtocol = PlaceDetailedForecastWireframe()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.apiDataManager = apiDataManager

        return view as! UIViewController
    }
}
