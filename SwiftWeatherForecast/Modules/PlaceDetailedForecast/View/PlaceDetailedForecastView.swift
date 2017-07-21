//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

class PlaceDetailedForecastView: UIViewController, PlaceDetailedForecastViewProtocol {
    var presenter: PlaceDetailedForecastPresenterProtocol?
    var tableViewDelegations: PlaceDetailedForecastTableViewDelegations?
    @IBOutlet weak var tableView: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Forecast"
        self.tableViewDelegations = PlaceDetailedForecastTableViewDelegations(tableView: self.tableView)
        self.presenter?.viewWillAppearEvent()
    }

    //MARK: Protocol

    func presentWeatherForecast(detailedForecastItem: PlaceDetailedForecastItem) {
        self.tableViewDelegations?.detailedForecastItem = detailedForecastItem
    }
}
