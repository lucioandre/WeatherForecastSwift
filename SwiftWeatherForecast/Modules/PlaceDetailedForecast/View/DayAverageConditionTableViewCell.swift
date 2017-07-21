//
//  DayAverageConditionTableViewCell.swift
//  SwiftWeatherForecast
//
//  Created by Avenue Brazil on 20/07/17.
//  Copyright © 2017 Lucio Fonseca. All rights reserved.
//

import UIKit

class DayAverageConditionTableViewCell: UITableViewCell {
    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.weatherIcon.layer.cornerRadius = 6
        self.weatherIcon.layer.masksToBounds = true
    }
    
}
