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
            if let p = places, p.count > 0 {
                self.tableView?.reloadData()
            }
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
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let place = self.places {
            return place.count > 0 ? place.count : 1
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PlaceSearchResultTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlaceSearchResultTableViewCell.self), for: indexPath) as! PlaceSearchResultTableViewCell
        if let place = self.places?[indexPath.row] {
            cell.placeName.text = place.formattedName
        }

        return cell
    }
    
}
