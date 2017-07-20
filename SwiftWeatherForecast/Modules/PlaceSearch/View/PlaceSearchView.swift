//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class PlaceSearchView: UIViewController, PlaceSearchViewProtocol, NVActivityIndicatorViewable {
    var presenter: PlaceSearchPresenterProtocol?
    var dataSource: PlaceSearchDataSource?

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Places"
        self.dataSource = PlaceSearchDataSource(tableView: self.tableView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.searchBar.becomeFirstResponder()
    }

    //MARK - Protocol Methdos

    func showPlaces(places: [PlaceSearchItem]) {
        self.dataSource?.places = places
    }

    func showProgressIndicator() {
        self.startAnimating(type: .ballTrianglePath)
    }

    func removeProgressIndicator() {
        self.stopAnimating()
    }
}


//MARK - Search Bar Delegate

extension PlaceSearchView : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.presenter?.searchEvent(searchKey: searchBar.text)
    }
}
