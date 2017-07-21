//
//  PlaceSearchDataSource.swift
//  SwiftWeatherForecast
//
//  Created by Avenue Brazil on 19/07/17.
//  Copyright © 2017 Lucio Fonseca. All rights reserved.
//

import Foundation
import UIKit

class PlaceSearchTableViewDataSource: NSObject, UITableViewDataSource {

    var tableView:UITableView?
    var places:[PlaceSearchItem]? {
        didSet {
            self.tableView?.reloadData()
        }
    }

    init(tableView:UITableView) {
        super.init()
        self.tableView = tableView
        self.tableView?.dataSource = self
        self.tableView?.estimatedRowHeight = 53
        self.tableView?.rowHeight = UITableViewAutomaticDimension

        let nibName = String(describing: PlaceSearchResultTableViewCell.self)
        self.tableView?.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
        self.tableView?.register(NoResultsTableViewCell.self, forCellReuseIdentifier: String(describing:NoResultsTableViewCell.self))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let place = self.places {
            //If object is instantiated but has no object then we return 1 to show No Results Cell
            return place.count > 0 ? place.count : 1
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let p = self.places, p.count > 0 && indexPath.row < p.count {
            let cell: PlaceSearchResultTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlaceSearchResultTableViewCell.self), for: indexPath) as! PlaceSearchResultTableViewCell
            let place = p[indexPath.row]
            cell.cityNameLabel.text = place.city
            cell.regionNameLabel.text = place.region
            return cell
        } else {
            let cell:NoResultsTableViewCell = tableView.dequeueReusableCell(withIdentifier:String(describing:NoResultsTableViewCell.self), for: indexPath) as! NoResultsTableViewCell
            cell.textLabel?.text = "Your search returned no results"
            cell.textLabel?.textAlignment = NSTextAlignment.center
            return cell
        }
    }
    
}
