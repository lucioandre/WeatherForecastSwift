//
//  UIViewControllerExtensions.swift
//  SwiftWeatherForecast
//
//  Created by Avenue Brazil on 20/07/17.
//  Copyright © 2017 Lucio Fonseca. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension UIViewController : NVActivityIndicatorViewable {
    func showProgressIndicator() {
        self.startAnimating(type: .ballTrianglePath)
    }

    func removeProgressIndicator() {
        self.stopAnimating()
    }
}
