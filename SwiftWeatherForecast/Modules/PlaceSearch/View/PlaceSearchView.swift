//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class PlaceSearchView: UIViewController, PlaceSearchViewProtocol {
    var presenter: PlaceSearchPresenterProtocol?
    var dataSource: PlaceSearchTableViewDataSource?

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather Forecast"
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.dataSource = PlaceSearchTableViewDataSource(tableView: self.tableView)
        self.tableView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.searchBar.becomeFirstResponder()
    }

    //MARK - Protocol Methdos

    func showPlaces(places: [PlaceSearchItem]?) {
        self.dataSource?.places = places
    }
}

//MARK: TableView Delegate

extension PlaceSearchView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView === self.tableView {
            self.presenter?.didSelectPlaceEvent(row: indexPath.row)
        }
    }
}


//MARK: Search Bar Delegate

extension PlaceSearchView : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.presenter?.searchEvent(searchKey: searchBar.text)
    }
}
