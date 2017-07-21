//
//  PlaceDetailedForecastDataSource.swift
//  SwiftWeatherForecast
//
//  Created by Avenue Brazil on 20/07/17.
//  Copyright © 2017 Lucio Fonseca. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import CoreLocation
import MapKit

enum DetailedForecastLayoutSections: Int {
    case currentForecast = 0, daysAheadForecast
}

struct DetailedForecastCellIdentifiers {
    static let dayAverage = String(describing: DayAverageConditionTableViewCell.self)
    static let currentWeather = String(describing: CurrentTemperatureTableViewCell.self)
}

class PlaceDetailedForecastTableViewDelegations: NSObject, UITableViewDataSource, UITableViewDelegate {

    var tableView:UITableView?

    var detailedForecastItem: PlaceDetailedForecastItem? {
        didSet {
            self.tableView?.reloadData()
        }
    }

    init(tableView:UITableView) {
        super.init()
        self.tableView = tableView
        self.configureTableView()
    }

    func configureTableView() {
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.rowHeight = UITableViewAutomaticDimension

        //Register Nibs
        self.tableView?.register(UINib(nibName: DetailedForecastCellIdentifiers.currentWeather, bundle: nil), forCellReuseIdentifier: DetailedForecastCellIdentifiers.currentWeather)
        self.tableView?.register(UINib(nibName: DetailedForecastCellIdentifiers.dayAverage, bundle: nil), forCellReuseIdentifier: DetailedForecastCellIdentifiers.dayAverage)
    }

    //MARK: Datasource

    func numberOfSections(in tableView: UITableView) -> Int {
        if detailedForecastItem != nil {
            return 2
        }
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if detailedForecastItem != nil {
            if section == DetailedForecastLayoutSections.currentForecast.rawValue {
                return 1
            }

            switch section {
            case DetailedForecastLayoutSections.currentForecast.rawValue:
                return 1
            case DetailedForecastLayoutSections.daysAheadForecast.rawValue:
                guard let daysForecast = self.detailedForecastItem?.daysForecast else {
                    return 0
                }
                return daysForecast.count
            default:
                return 0
            }
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case DetailedForecastLayoutSections.currentForecast.rawValue:
            return currentWeatherCell(indexPath: indexPath)
        default:
            return dayWeatherCell(indexPath: indexPath)
        }
    }

    //MARK: Cell Assembly

    func currentWeatherCell(indexPath: IndexPath) -> CurrentTemperatureTableViewCell {
        let cell: CurrentTemperatureTableViewCell = self.tableView?.dequeueReusableCell(withIdentifier: DetailedForecastCellIdentifiers.currentWeather, for: indexPath) as! CurrentTemperatureTableViewCell
        if let location = detailedForecastItem?.place, let currentCondition = detailedForecastItem?.currentCondition {
            cell.temperatureLabel.text = currentCondition.temperatureF
            cell.cityLabel.text = location.area
            cell.weatherDescription.text = currentCondition.weatherDescription

            //Set map as background image
            let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(location.latitude), longitude: CLLocationDegrees(location.longitude))
            let region = MKCoordinateRegionMakeWithDistance(location, 30000, 30000)
            cell.mapView.setRegion(region, animated: true)
        }
        return cell
    }

    func dayWeatherCell(indexPath: IndexPath) -> DayAverageConditionTableViewCell {
        let cell: DayAverageConditionTableViewCell = self.tableView?.dequeueReusableCell(withIdentifier: DetailedForecastCellIdentifiers.dayAverage, for: indexPath) as! DayAverageConditionTableViewCell
        if let dayInformation = detailedForecastItem?.daysForecast[indexPath.row] {
            cell.weekdayLabel.text = dayInformation.weekDay
            cell.minTemperatureLabel.text = dayInformation.minTemperatureF
            cell.maxTemperatureLabel.text = dayInformation.maxTemperatureF
            cell.weatherIcon.sd_setImage(with: URL(string: dayInformation.weatherIconUrlString))
        }
        return cell
    }

    //MARK: Delegate

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == DetailedForecastLayoutSections.currentForecast.rawValue {
            return 236.0
        } else {
            return 38.0
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
