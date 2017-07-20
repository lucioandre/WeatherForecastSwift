//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation
import UIKit

class PlacesView: UIViewController, PlacesViewProtocol {
    var presenter: PlacesPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.configureNavigationBar()
    }

    func configureNavigationBar() {
        self.title = "Weather Forecast"
        let addLocationButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addLocationPressed))
        self.navigationItem.setRightBarButton(addLocationButtonItem, animated: false)
    }

    func addLocationPressed() {
        self.presenter?.addPresenterEvent()
    }
}
