//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

protocol PlaceDetailedForecastViewProtocol: class {
    var presenter: PlaceDetailedForecastPresenterProtocol? { get set }
    func showProgressIndicator()
    func removeProgressIndicator()
    func presentWeatherForecast(detailedForecastItem: PlaceDetailedForecastItem)
}

protocol PlaceDetailedForecastWireframeProtocol: class {
    static func presentPlaceDetailedForecastModule(fromView view: UIViewController, _ locationDescription: String)

}

protocol PlaceDetailedForecastPresenterProtocol: class {
    var view: PlaceDetailedForecastViewProtocol? { get set }
    var interactor: PlaceDetailedForecastInteractorInputProtocol? { get set }
    var wireFrame: PlaceDetailedForecastWireframeProtocol? { get set }

    func viewWillAppearEvent()
}

protocol PlaceDetailedForecastInteractorOutputProtocol: class {

}

protocol PlaceDetailedForecastInteractorInputProtocol: class {
    var presenter: PlaceDetailedForecastInteractorOutputProtocol? { get set }
    var apiDataManager: PlaceDetailedForecastAPIClientProtocol? { get set }

    func loadDetailedForecast(locationDescription: String, completion: @escaping (_ response: PlaceDetailedForecastItem?) -> Swift.Void)
}
